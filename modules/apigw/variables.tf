variable "aws_region" {
  description = "aws region"
  type        = string
}
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

variable "function_name" {
  description = "Lambda Name"
  type        = list(string)
}

variable "lambda_invoke_arn" {
  description = "Lambda arn"
  type        = list(string)
}
