# Input Variables
variable "aws_region" {
  description = "aws region"
  type        = string
}

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
