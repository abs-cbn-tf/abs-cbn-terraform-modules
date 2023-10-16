# Input Variables
variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "function_configurations" {
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

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
