resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.task_family}" # Replace with your desired log group name
  retention_in_days = 30                        # Adjust the retention period as needed
}
resource "aws_ecr_repository" "example" {
  count                = length(var.repositories)
  name                 = var.repositories[count.index]
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}


variable "repositories" {
  description = "A list of ECR repository names to be created"
  type        = list(string)
  #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
  default = ["push-web"]
}


output "repository_urls" {
  value = aws_ecr_repository.example[*].repository_url
}

#variable "task_role_name" {
#  description = "Name for the IAM role that the ECS task will assume"
#  type        = string
#}


module "iam_role" {
  source         = "../../iamroles"
  task_role_name = var.task_role_name
}

# image = aws_ecr_repository.example[1].repository_url 
#"image": "${var.container_image}"

resource "aws_ecs_task_definition" "taskdef" {
  family = var.task_family
  # container_definitions = var.container_definitions
  container_definitions = jsonencode([{
    name   = "${var.container_name}"
    image  = "${aws_ecr_repository.example[0].repository_url}"
    cpu    = "${var.container_cpu}"
    memory = "${var.container_memory}"

    portMappings = [{
      containerPort = "${var.container_cport}"
      hostPort      = "${var.container_hport}"
      protocol      = "${var.container_protocol}"
    }]
    log_configuration = {
      log_driver = "awslogs"
      options = {
        "awslogs-group"        = "${aws_cloudwatch_log_group.ecs_logs.name}"
        "awslog-region"        = "ap-southeast-1"
        "awslog-stream-prefix" = "ecs"
      }
    }
    }
  ])
  # [
  #   {
  #     "name": "${var.container_name}",
  #     "image": "${aws_ecr_repository.example[0].repository_url}",
  #     "cpu": ${var.container_cpu},
  #     "memory": ${var.container_memory},
  #     "portMappings": [
  #       {
  #         "containerPort": ${var.container_cport},
  #         "hostPort": ${var.container_hport},
  #         "protocol": "${var.container_protocol}"
  #       }
  #     ],
  #     "log_configuration": {
  #       "log_driver": "awslogs",
  #       "options": {
  #         "awslogs-group": "/ecs/${var.task_family}",
  #         "awslogs-region": "ap-southeast-1",
  #         "awslogs-stream-prefix": "ecs"
  #       }
  #     }
  #   }  
  # ]

  #  execution_role_arn       = aws_iam_role.role.arn
  execution_role_arn = module.iam_role.iam_role_arn
  task_role_arn      = module.iam_role.iam_role_arn
  #  task_role_arn            = module.iam_role.iam_role_arn
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  network_mode             = var.network_mode
  requires_compatibilities = ["${var.requires_compatibilities}"]
  runtime_platform {
    operating_system_family = var.operating_system
    cpu_architecture        = var.cpu_architecture
  }
  #   volume {
  #     name      = "service-storage"
  #     host_path = "/ecs/service-storage"
  #   }

  #   placement_constraints {
  #     type       = "memberOf"
  #     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
  #   }
}

# ecsTaskExecutionRole

/*
resource "aws_iam_role" "role" {
  name = var.task_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "ecs.amazonaws.com",
            "ecs-tasks.amazonaws.com"
          ]
        }
      },
    ]
  })
}
*/
resource "aws_iam_role_policy_attachment" "attach1" {
  #  role       = aws_iam_role.role.name
  role       = module.iam_role.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "attach2" {
  #  role       = aws_iam_role.role.name
  role       = module.iam_role.iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ECS Service
resource "aws_ecs_service" "ecs_service" {
  name                              = var.service_name
  depends_on                        = [var.cluster_arn]
  cluster                           = var.cluster_arn
  task_definition                   = aws_ecs_task_definition.taskdef.arn
  desired_count                     = 0
  health_check_grace_period_seconds = 0

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  tags                               = var.tags
  load_balancer {
    target_group_arn = var.alb_tg_arn #put arn here from output
    container_name   = var.container_name
    container_port   = var.ecs_lb_cport

  }

  network_configuration {
    subnets          = var.subnets             # Replace with your subnet IDs
    security_groups  = var.ecs_security_groups # Replace with your security group IDs
    assign_public_ip = true
  }
}

# app auto-scaling

/*
#------------------------------------------------------------------------------
# AWS Auto Scaling - CloudWatch Alarm CPU High
#------------------------------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  depends_on          = [aws_ecs_service.ecs_service]
  alarm_name          = "${var.service_name}-cpu-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 120
  statistic           = "Maximum"
  threshold           = 70
  dimensions = {
    ClusterName = var.cluster_arn
    ServiceName = var.service_name
  }
  alarm_actions = [aws_appautoscaling_policy.scale_up_policy.arn]

  # tags = var.tags
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - CloudWatch Alarm CPU Low
#------------------------------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  depends_on          = [aws_ecs_service.ecs_service]
  alarm_name          = "${var.service_name}-cpu-low"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  dimensions = {
    ClusterName = var.cluster_arn
    ServiceName = var.service_name
  }
  alarm_actions = [aws_appautoscaling_policy.scale_down_policy.arn]

  # tags = var.tags
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - Scaling Up Policy
#------------------------------------------------------------------------------
resource "aws_appautoscaling_policy" "scale_up_policy" {
  depends_on         = [aws_ecs_service.ecs_service, aws_appautoscaling_target.scale_target]
  name               = "${var.service_name}-scale-up-policy"
  service_namespace  = "ecs"
  resource_id        = "service/${var.tf_my_cluster}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 1
    }
  }
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - Scaling Down Policy
#------------------------------------------------------------------------------
resource "aws_appautoscaling_policy" "scale_down_policy" {
  depends_on         = [aws_ecs_service.ecs_service, aws_appautoscaling_target.scale_target]
  name               = "${var.service_name}-scale-down-policy"
  service_namespace  = "ecs"
  resource_id        = "service/${var.tf_my_cluster}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 300
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -1
    }
  }
}

#------------------------------------------------------------------------------
# AWS Auto Scaling - Scaling Target
#------------------------------------------------------------------------------
resource "aws_appautoscaling_target" "scale_target" {
  service_namespace  = "ecs"
  resource_id        = "service/${var.tf_my_cluster}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 1
  max_capacity       = 2
}
*/
