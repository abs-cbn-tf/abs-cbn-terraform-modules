variable "aws_region" {
  description = "aws region"
  type        = string
}

# variable "apigw_lambda_configuration" {
#   description = "Map of Lambda function and APIGW configurations"
#   type = map(object({
#     # lambda config
#     function_name  = string
#     iam_role_name  = string
#     runtime        = string
#     handler        = string
#     memory         = number
#     env_var        = map(string)
#     my_lambda_tags = map(string)

#     #apigw config
#     apigw_name    = string
#     resource_name = string
#     method_name   = string
#     stage_name    = string
#     api_key       = string
#     usage_plan    = string
#   }))
# }

variable "function_count" {
  type    = number
  default = 1
}

variable "function_configurations" {
  description = "Map of Lambda function configurations"
  type = list(object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  }))
}

variable "apigw_count" {
  type    = number
  default = 1
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
