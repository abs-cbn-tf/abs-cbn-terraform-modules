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

#cluster variables
variable "tf_my_cluster" {
  description = "name for cluster"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
}

variable "tg_arn" {
  type = string
}

variable "cluster_arn" {
  type = string
}
