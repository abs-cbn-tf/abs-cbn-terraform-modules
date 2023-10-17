variable "aws_region" {}
variable "profile" {}

# FOR LAMBDAS WITH EVENTS TRIGGER
variable "events_function_configurations_2" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name = string
    iam_role_name = string
    runtime       = string
    handler       = string
    memory        = number
    env_var       = map(string)
    lambda_tags   = map(string)
  })
}
variable "eventbridge_configuration_2" {
  description = "List of cloudwatch events configurations"
  type = object({
    name                 = string
    description          = string
    event_bus_name       = string
    scheduled_expression = string
    event_pattern        = string
    event_tags           = map(string)
  })
}

# FOR LAMBDAS WITH APIGW TRIGGER
variable "apigw_function_configurations_1" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name = string
    iam_role_name = string
    runtime       = string
    handler       = string
    memory        = number
    env_var       = map(string)
    lambda_tags   = map(string)
  })
}

variable "apigw_configurations_1" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
    apigw_tags    = map(string)
  })
}

variable "apigw_function_configurations_2" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name = string
    iam_role_name = string
    runtime       = string
    handler       = string
    memory        = number
    env_var       = map(string)
    lambda_tags   = map(string)
  })
}

variable "apigw_configurations_2" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
    apigw_tags    = map(string)
  })
}

variable "function_configurations_1" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name = string
    iam_role_name = string
    runtime       = string
    handler       = string
    memory        = number
    env_var       = map(string)
    lambda_tags   = map(string)
  })
}

# ALB CONFIGURATION
variable "alb_configurations" {
  type = object({
    # alb
    alb_name = string #news-web-alb
    lb_type  = string #application
    # target group
    target_group_name             = string #news-web-tg
    target_type                   = string #ip
    ip_address_type               = string #ipv4
    target_group_port             = number #3000
    target_group_protocol         = string #HTTP
    target_group_protocol_version = string #HTTP1
    target_group_health_check     = map(string)
    # listener
    listener_port           = number #443
    listener_protocol       = string #HTTPS
    listener_ssl_policy     = string #ELBSecurityPolicy-TLS-1-2-2017-01
    listener_default_action = map(string)
    alb_tags                = map(string)
  })
}

#ECS
variable "cluster_configurations" {
  type = object({
    cluster_name      = string
    capacity_provider = string
    cluster_tags      = map(string)
  })
}
variable "taskdef_configurations" {
  type = object({
    task_family              = string
    task_cpu                 = number
    task_memory              = number
    task_role_name           = string
    network_mode             = string
    requires_compatibilities = string
    operating_system_family  = string
    cpu_architecture         = string

    #container
    container_name      = string
    container_cpu       = number
    container_memory    = number
    container_port      = number
    container_host_port = number
    container_protocol  = string

    taskdef_tags = map(string)
  })
}

variable "service_configurations" {
  type = object({
    service_name                       = string
    desired_count                      = number #0
    health_check_grace_period_seconds  = number #0
    deployment_minimum_healthy_percent = number #100
    deployment_maximum_percent         = number #200
    ecs_lb_port                        = number #3000
    assign_public_ip                   = bool   #true
    service_tags                       = map(string)
  })
}

variable "repositories" {
  description = "A list of ECR repository names to be created"
  type        = string
  #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
  default = "push-web"
}

# variables for vpc
variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}

variable "public_subnet_az1_abs" {}
variable "public_subnet_az2_abs" {}
variable "private_app_subnet_az1_abs" {}
variable "private_app_subnet_az2_abs" {}
variable "private_data_subnet_az1_abs" {}
variable "private_data_subnet_az2_abs" {}
variable "egress_cidr_blocks" {
  type    = list(string)
  default = []
}
variable "vpc_tags" {}

variable "sg_configurations_1" {
  type = object({
    sg_name        = string
    sg_description = string

    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
    }))

    sg_tags = map(string)
  })
}

variable "sg_configurations_2" {
  type = object({
    sg_name        = string
    sg_description = string

    ingress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
    }))
    egress_rules = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
      self        = bool
    }))

    sg_tags = map(string)
  })
}

# GLOBAL TAGGINGS
variable "global_tags" {
  description = "Global tags for all resources"
  type        = map(string)
  default = {
    global_tag = "test"
  }
}

variable "individual_tags" {
  description = "Individual tags for specific modules"
  type        = map(map(string))
  default = {
    vpc = {
      # vpc
      "abs::cost-center"      = "50016043"
      "abs::criticality"      = "Silver"
      "abs::environment"      = "UAT"
      "abs::product"          = "NewsWeb"
      "abs::tech-owner"       = "DCT"
      "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
      "abs::url"              = "uat-news.abs-cbn.com"
      "abs:backup"            = "No"
      "abs::lob"              = "News"
      "abs:shared"            = "No"
      Name                    = "News Consumption"
    }
  }
}
