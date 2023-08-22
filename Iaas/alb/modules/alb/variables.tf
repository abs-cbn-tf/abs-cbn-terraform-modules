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

# variable "listener_rules" {
#   description = "List of listener rules for the ALB"
#   type = list(object({
#     priority  = number
#     condition = map(string)
#     action    = map(string)
#   }))
# }

variable "vpc_id" {
  description = "ID of the VPC where the ALB will be deployed"
  type        = string
}

# variable "listener_cert_arn" {
#   description = "exsisting listener certificate"
#   type        = string
# }

