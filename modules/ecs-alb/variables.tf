variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}
# ecs service variables
# Variables for the task definition
variable "task_family" {
  description = "Family for task (name)"
  type        = string
}

variable "task_cpu" {
  description = "CPU for task"
  type        = number
}

variable "task_memory" {
  description = "Memory for task"
  type        = number
}

variable "task_role_name" {
  description = "Role name for task"
  type        = string
}

variable "network_mode" {
  description = "Network mode for task"
  type        = string
}

# variable "container_definitions" {
#   description = "Network mode for task"
#   type        = string
# }
# Container Definition Variables
variable "container_name" {
  description = "Container Name"
  type        = string
}
# variable "container_image" {
#   description = "Container Image"
#   type        = string
# }
variable "container_cpu" {
  description = "Container CPU"
  type        = number
}
variable "container_memory" {
  description = "Container Memory"
  type        = number
}
variable "container_cport" {
  description = "Container Container Port"
  type        = number
}
variable "container_hport" {
  description = "Container Host Port"
  type        = number
}
variable "container_protocol" {
  description = "Container Protocol"
  type        = string
}
# EOF Container Definitions Variables

variable "requires_compatibilities" {
  description = "Container Definitions"
  type        = string
}

variable "operating_system" {
  description = "Container Definitions"
  type        = string
}

variable "cpu_architecture" {
  description = "Container Definitions"
  type        = string
}

# Variables for the service
variable "service_name" {
  description = "Container Definitions"
  type        = string
}

variable "service_role_name" {
  description = "Container Definitions"
  type        = string
}
variable "ecs_lb_cport" {}

#cluster variables
variable "tf_my_cluster" {
  description = "name for cluster"
  type        = string
}

variable "tf_capacity_provider" {
  description = "Type of provider (fagate or fargate spot)"
  type        = string
}

# ALB
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

variable "subnets" {
  description = "List of subnets where the ALB will be deployed"
  type        = list(string)
}

# variable "security_groups" {
#   description = "List of security groups associated with the ALB"
#   type        = list(string)
# }

variable "ecs_security_groups" {
  description = "List of security groups associated with the ALB"
  type        = list(string)
}
variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "repositories" {
  description = "A list of ECR repository names to be created"
  type        = string
  #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
  default = "push-web"
}
