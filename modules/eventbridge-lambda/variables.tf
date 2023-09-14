variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "function_configurations" {
  description = "Map of Lambda function configurations"
  type = object({
    function_name  = string
    iam_role_name  = string
    runtime        = string
    handler        = string
    memory         = number
    env_var        = map(string)
    my_lambda_tags = map(string)
  })
}

variable "eventbridge_configuration" {
  description = "List of cloudwatch events configurations"
  type = object({
    name                 = string
    description          = string
    event_bus_name       = string
    scheduled_expression = string
    event_pattern        = string
  })
}
