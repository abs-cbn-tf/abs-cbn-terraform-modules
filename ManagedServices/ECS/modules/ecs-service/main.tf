resource "aws_ecs_task_definition" "taskdef" {
  family = var.task_family
  # container_definitions = var.container_definitions
  container_definitions    = <<EOF
    [
      {
        "name": "${var.container_name}",
        "image": "${var.container_image}",
        "cpu": ${var.container_cpu},
        "memory": ${var.container_memory},
        "portMappings": [
          {
            "containerPort": ${var.container_cport},
            "hostPort": ${var.container_hport},
            "protocol": "${var.container_protocol}"
          }
        ]
      }  
    ]
  EOF
  execution_role_arn       = aws_iam_role.role.arn
  task_role_arn            = aws_iam_role.role.arn
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

resource "aws_iam_role_policy_attachment" "attach1" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "attach2" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ECS Service
resource "aws_ecs_service" "ecs_service" {
  name                              = var.service_name
  depends_on                        = [var.cluster_arn]
  cluster                           = var.cluster_arn
  task_definition                   = aws_ecs_task_definition.taskdef.arn
  desired_count                     = 2
  health_check_grace_period_seconds = 300

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  load_balancer {
    target_group_arn = var.tg_arn #put arn here from output
    container_name   = var.container_name
    container_port   = 3000

  }

  network_configuration {
    subnets          = var.public_subnets       # Replace with your subnet IDs
    security_groups  = ["sg-0e028cc09f558e6c8"] # Replace with your security group IDs
    assign_public_ip = true
  }
}

# app auto-scaling


#------------------------------------------------------------------------------
# AWS Auto Scaling - CloudWatch Alarm CPU High
#------------------------------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
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

  name               = "${var.service_name}-scale-up-policy"
  service_namespace  = "ecs"
  resource_id        = "service/${var.cluster_arn}/${var.service_name}"
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
  name               = "${var.service_name}-scale-down-policy"
  service_namespace  = "ecs"
  resource_id        = "service/${var.cluster_arn}/${var.service_name}"
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
  resource_id        = "service/${var.cluster_arn}/${var.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = 1
  max_capacity       = 2
}

