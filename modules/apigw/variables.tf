variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "apigw_lambda_invoke_arn" {
  type = list(string)
}

variable "apigw_function_name" {
  type = list(string)
}

variable "apigw_count" {
  description = "Lambda arn"
  type        = string
}

variable "apigw_configurations" {
  description = "Map of APIGW configurations"
  type = list(object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
  }))
}
