variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "ap-southeast-1"
}

variable "vpc_id" {
  description = "vpc id for alb"
  type        = string
  default     = "vpc-0cbd8776bdd708ee5"
}

variable "subnets" {
  description = "subnets for alb"
  type        = list(string)
  default = [
    "subnet-09fbd69c967ec2b13", # Sandbox existing subnets
    "subnet-02e234f573a5e7a53"
  ]
}

variable "security_groups" {
  description = "security groups for alb"
  type        = list(string)
  default = [
    "sg-0e028cc09f558e6c8"
  ]
}

variable "listener_port" {
  description = "listener port"
  type        = number
  default     = 80
}

variable "target_group_name" {
  description = "target group name"
  type        = string
  default     = "terraform-tg"
}

variable "target_group_port" {
  description = "target group port"
  type        = number
  default     = 3000
}

# variable "listener_cert_arn" {
#   description = "exsisting listener certificate"
#   type        = string
#   default     = "arn:aws:acm:ap-southeast-1:892339339186:certificate/43e748ed-311b-4559-9b9a-ae69de43ae13"
# }

variable "alb_name" {
  description = "alb name"
  type        = string
  default     = "terraform-alb"
}

