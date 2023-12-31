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
    circuit_breaker_enable             = bool
    circuit_breaker_rollback           = bool
    ecs_lb_port                        = number #3000
    assign_public_ip                   = bool   #true
    service_tags                       = map(string)
  })
}

variable "ecs_security_groups" {}
# variable "ecs_lb_cport" {}
# # Variables for the task definition
# variable "task_family" {
#   description = "Family for task (name)"
#   type        = string
# }

# variable "task_cpu" {
#   description = "CPU for task"
#   type        = number
# }

# variable "task_memory" {
#   description = "Memory for task"
#   type        = number
# }

# variable "task_role_name" {
#   description = "Role name for task"
#   type        = string
# }

# variable "network_mode" {
#   description = "Network mode for task"
#   type        = string
# }

# variable "container_definitions" {
#   description = "Network mode for task"
#   type        = string
# }

# Container Definition Variables
# variable "container_name" {
#   description = "Container Name"
#   type        = string
# }
# variable "container_image" {
#   description = "Container Image"
#   type        = string
# }

# variable "container_cpu" {
#   description = "Container CPU"
#   type        = number
# }
# variable "container_memory" {
#   description = "Container Memory"
#   type        = number
# }
# variable "container_cport" {
#   description = "Container Container Port"
#   type        = number
# }
# variable "container_hport" {
#   description = "Container Host Port"
#   type        = number
# }
# variable "container_protocol" {
#   description = "Container Protocol"
#   type        = string
# }
# EOF Container Definitions Variables

# variable "requires_compatibilities" {
#   description = "Container Definitions"
#   type        = string
# }

# variable "operating_system" {
#   description = "Container Definitions"
#   type        = string
# }

# variable "cpu_architecture" {
#   description = "Container Definitions"
#   type        = string
# }

# # Variables for the service
# variable "service_name" {
#   description = "Container Definitions"
#   type        = string
# }

# variable "service_role_name" {
#   description = "Container Definitions"
#   type        = string
# }

#cluster variables
variable "cluster_name" {
  description = "name for cluster"
  type        = string
}

variable "service_subnets" {
  description = "subnets"
  type        = list(string)
}

variable "alb_tg_arn" {
  description = "target group arn from alb"
  type        = string
}

variable "cluster_arn" {
  type = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

# variable "repositories" {
#   description = "A list of ECR repository names to be created"
#   type        = list(string)
#   #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
#   default = ["push-web"]
# }

variable "repositories" {
  description = "A list of ECR repository names to be created"
  type        = string
  #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
  default = "push-web"
}
