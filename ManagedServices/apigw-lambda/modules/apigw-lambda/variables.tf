variable "aws_region" {
  description = "aws region"
  type        = string
}
# Variables for APIGW
variable "apigw_name" {
  description = "Name for apigw"
  type        = string
}

variable "resource_name" {
  description = "Name for the resource"
  type        = string
}

variable "method_name" {
  description = "Name for the method"
  type        = string
}

variable "stage_name" {
  description = "Name for stage"
  type        = string
}

variable "api_key" {
  description = "Name for api key"
  type        = string
}

variable "usage_plan" {
  description = "Name for usage plan"
  type        = string
}

# Variables for lambda
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
