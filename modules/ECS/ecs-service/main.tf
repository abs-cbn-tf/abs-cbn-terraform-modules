resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.taskdef_configurations.task_family}" # Replace with your desired log group name
  retention_in_days = 30                                               # Adjust the retention period as needed
}
resource "aws_ecr_repository" "example" {
  # count                = length(var.repositories)
  # name                 = var.repositories[count.index]
  name                 = var.repositories
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = var.tags
}
module "iam_role" {
  source         = "../../iamroles"
  task_role_name = var.taskdef_configurations.task_role_name
}

# image = aws_ecr_repository.example[1].repository_url 
#"image": "${var.container_image}"

resource "aws_ecs_task_definition" "taskdef" {
  family = var.taskdef_configurations.task_family
  # container_definitions = var.container_definitions
  container_definitions = jsonencode([{
    name   = "${var.taskdef_configurations.container_name}"
    image  = "${aws_ecr_repository.example.repository_url}:latest"
    cpu    = "${var.taskdef_configurations.container_cpu}"
    memory = "${var.taskdef_configurations.container_memory}"

    portMappings = [{
      containerPort = "${var.taskdef_configurations.container_port}"
      hostPort      = "${var.taskdef_configurations.container_host_port}"
      protocol      = "${var.taskdef_configurations.container_protocol}"
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

  execution_role_arn       = module.iam_role.iam_role_arn
  task_role_arn            = module.iam_role.iam_role_arn
  cpu                      = var.taskdef_configurations.task_cpu
  memory                   = var.taskdef_configurations.task_memory
  network_mode             = var.taskdef_configurations.network_mode
  requires_compatibilities = ["${var.taskdef_configurations.requires_compatibilities}"]
  runtime_platform {
    operating_system_family = var.taskdef_configurations.operating_system_family
    cpu_architecture        = var.taskdef_configurations.cpu_architecture
  }
  tags = merge(var.tags, var.taskdef_configurations.taskdef_tags)
}

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
  name                              = var.service_configurations.service_name
  cluster                           = var.cluster_arn
  task_definition                   = aws_ecs_task_definition.taskdef.arn
  desired_count                     = var.service_configurations.desired_count
  health_check_grace_period_seconds = var.service_configurations.health_check_grace_period_seconds

  deployment_minimum_healthy_percent = var.service_configurations.deployment_minimum_healthy_percent
  deployment_maximum_percent         = var.service_configurations.deployment_maximum_percent

  tags = merge(var.tags, var.service_configurations.service_tags)
  load_balancer {
    target_group_arn = var.alb_tg_arn #put arn here from output
    container_name   = var.taskdef_configurations.container_name
    container_port   = var.service_configurations.ecs_lb_port
  }

  network_configuration {
    subnets          = var.subnets             # Replace with your subnet IDs
    security_groups  = var.ecs_security_groups # Replace with your security group IDs
    assign_public_ip = var.service_configurations.assign_public_ip
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
