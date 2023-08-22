variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
}

# variables for apigw
variable "apigw_count" {
  description = "apigw count"
  type        = number
}
variable "apigw_name" {
  description = "Name for apigw"
  type        = list(string)
}

variable "resource_name" {
  description = "Name for the resource"
  type        = list(string)
}

variable "method_name" {
  description = "Name for the method"
  type        = list(string)
}

variable "stage_name" {
  description = "Name for stage"
  type        = list(string)
}

variable "api_key" {
  description = "Name for api key"
  type        = list(string)
}

variable "usage_plan" {
  description = "Name for usage plan"
  type        = list(string)
}

# variables for lambda
# Input Variables
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
