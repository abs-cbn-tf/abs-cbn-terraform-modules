# Input Variables
variable "aws_region" {
  description = "aws region"
  type        = string
}
variable "lambda_count" {
  description = "lambda count"
  type        = number
}
variable "function_name" {
  description = "aws region"
  type        = list(string)
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
  type        = list(string)
}

variable "memory" {
  description = "memory size"
  type        = string
}

variable "env_var" {
  description = "Environment variables for lambda"
  type        = list(map(string))
}

variable "my_lambda_tags" {
  description = "Tags to set on the lambda"
  type        = list(map(string))
}
