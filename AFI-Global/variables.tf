variable "aws_region" {}
variable "profile" {}
# VPC variables
variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}

# ALB and ECS configurations
variable "alb_configurations" {
  type = object({
    alb_name = string
    lb_type  = string
    target_group_name             = string
    target_type                   = string
    ip_address_type               = string
    target_group_port             = number
    target_group_protocol         = string
    target_group_protocol_version = string
    target_group_health_check     = map(string)
    listener_port           = number
    listener_protocol       = string
    listener_ssl_policy     = string
    listener_default_action = map(string)
    alb_tags                = map(string)
  })
}

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
    container_name           = string
    container_cpu            = number
    container_memory         = number
    container_port           = number
    container_host_port      = number
    container_protocol       = string
    taskdef_tags             = map(string)
  })
}

variable "service_configurations" {
  type = object({
    service_name                       = string
    desired_count                      = number
    health_check_grace_period_seconds  = number
    deployment_minimum_healthy_percent = number
    deployment_maximum_percent         = number
    circuit_breaker_enable             = bool
    circuit_breaker_rollback           = bool
    ecs_lb_port                        = number
    assign_public_ip                   = bool
    service_tags                       = map(string)
  })
}

variable "repositories" {
  description = "A list of ECR repository names to be created"
  type        = string
  default     = "push-web"
}

# Security Group configurations
variable "sg_configurations_1" {
  type = object({
    sg_name        = string
    sg_description = string
    ingress_rules  = list(object({
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
    ingress_rules  = list(object({
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

# Global Tags
variable "global_tags" {
  description = "Global tags for all resources"
  type        = map(string)
  default = {
    global_tag = "test"
  }
}

# Individual Tags
variable "individual_tags" {
  description = "Individual tags for specific modules"
  type        = map(map(string))
  default     = {
    # Example individual tags
    vpc = {
      "example_tag_key" = "example_tag_value"
    }
  }
}

# VPC egress CIDR blocks
variable "egress_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"] # Example default value
}

# Additional VPC tags
variable "vpc_tags" {
  type    = map(string)
  default = {
    "example_tag_key" = "example_tag_value"
  }
}

