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
  type        = string
}

variable "task_memory" {
  description = "Memory for task"
  type        = string
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
variable "container_image" {
  description = "Container Image"
  type        = string
}
variable "container_cpu" {
  description = "Container CPU"
  type        = string
}
variable "container_memory" {
  description = "Container Memory"
  type        = string
}
variable "container_cport" {
  description = "Container Container Port"
  type        = string
}
variable "container_hport" {
  description = "Container Host Port"
  type        = string
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

# variables for alb tg
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "subnets" {
  description = "List of subnets where the ALB will be deployed"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security groups associated with the ALB"
  type        = list(string)
}

variable "ecs_security_groups" {
  description = "List of security groups associated with the ALB"
  type        = list(string)
}
variable "listener_port" {
  description = "Port for the ALB listener"
  type        = number
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

