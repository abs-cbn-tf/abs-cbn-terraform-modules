variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

# Variables for the cluster
variable "tf_my_cluster" {
  description = "name for cluster"
  type        = string
  default     = "terraform_cluster"
}

variable "tf_capacity_provider" {
  description = "Type of provider (fagate or fargate spot)"
  type        = string
  default     = "FARGATE_SPOT"
}

# Variables for the task definitions
variable "task_family" {
  description = "Family for task (name)"
  type        = string
  default     = "terraform-taskdef"
}

variable "task_cpu" {
  description = "CPU for task"
  type        = string
  default     = 1024
}

variable "task_memory" {
  description = "Memory for task"
  type        = string
  default     = 2048
}

variable "task_role_name" {
  description = "Role name for task"
  type        = string
  default     = "terraform-task-execution-role"
}

variable "network_mode" {
  description = "Network mode for task"
  type        = string
  default     = "awsvpc"
}

# variable "container_definitions" {
#   description = "Container Definitions"
#   type        = string
#   default     = <<EOF
# [
#   {
#     "name": "my-container",
#     "image": "892339339186.dkr.ecr.ap-southeast-1.amazonaws.com/test-app:latest",
#     "cpu": 512,
#     "memory": 256,
#     "portMappings": [
#       {
#         "containerPort": 3000,
#         "hostPort": 3000,
#         "protocol": "tcp"
#       }
#     ]
#   }
# ]
# EOF
# }

# Container Definition Variables
variable "container_name" {
  description = "Container Name"
  type        = string
  default     = "my-container"
}
variable "container_image" {
  description = "Container Image"
  type        = string
  default     = "892339339186.dkr.ecr.ap-southeast-1.amazonaws.com/test-app"
}
variable "container_cpu" {
  description = "Container CPU"
  type        = string
  default     = 256
}
variable "container_memory" {
  description = "Container Memory"
  type        = string
  default     = 512
}
variable "container_cport" {
  description = "Container Container Port"
  type        = string
  default     = 3000
}
variable "container_hport" {
  description = "Container Host Port"
  type        = string
  default     = 3000
}
variable "container_protocol" {
  description = "Container Protocol"
  type        = string
  default     = "tcp"
}
# EOF Container Definitions Variables
variable "requires_compatibilities" {
  description = "Container Definitions"
  type        = string
  default     = "FARGATE"
}

variable "operating_system" {
  description = "Container Definitions"
  type        = string
  default     = "LINUX"
}

variable "cpu_architecture" {
  description = "Container Definitions"
  type        = string
  default     = "X86_64"
}

# Variables for the service
variable "service_name" {
  description = "Container Definitions"
  type        = string
  default     = "terraform-service"
}

variable "service_role_name" {
  description = "Container Definitions"
  type        = string
  default     = "terraform-service-role"
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default = [
    "subnet-09fbd69c967ec2b13", # Sandbox existing subnets
    "subnet-02e234f573a5e7a53"
  ]
}
