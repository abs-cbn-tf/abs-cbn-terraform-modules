variable "aws_region" {}
variable "profile" {}

variable "function_configurations_1" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name = string
    iam_role_name = string
    runtime       = string
    handler       = string
    memory        = number
    env_var       = map(string)
    lambda_tags   = map(string)
  })
}
