variable "aws_region" {
  description = "aws region"
  type        = string
}
variable "lambda_invoke_arn" {
  type = string
}
variable "lambda_function_name" {
  type = string
}
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
