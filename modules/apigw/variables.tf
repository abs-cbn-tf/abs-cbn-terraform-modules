variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "apigw_lambda_invoke_arn" {
  type = string
}

variable "apigw_function_name" {
  type = string
}

variable "apigw_configurations" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  })
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

