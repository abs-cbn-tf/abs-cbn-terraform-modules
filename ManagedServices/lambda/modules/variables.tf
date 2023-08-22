# Input Variables
variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "function_name" {
  description = "aws region"
  type        = string
}

variable "runtime" {
  description = "runtime"
  type        = string
}

variable "handler" {
  description = "handler"
  type        = string
}

variable "iam_role_name" {
  description = "role name"
  type        = string
}

variable "memory" {
  description = "memory size"
  type        = string
}

variable "env_var" {
  description = "Environment variables for lambda"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default     = {}
}
