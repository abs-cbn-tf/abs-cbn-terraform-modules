# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to be used by terraform"
  type        = string
  default     = "naren"
}

# essential variables for Lambda 
variable "function_name" {
  type    = string
  default = "imp-page-api"
}

variable "runtime" {
  description = "Runtime version"
  type        = string
  default     = "nodejs16.x"
}

variable "handler" {
  description = "Lambda function handler"
  type        = string
  default     = "index.handler"
}

variable "iam_role_name" {
  description = "Role name for the lambda"
  type        = string
  default     = "imp-content-api-role"
}

variable "memory" {
  description = "Memory size for the lambda"
  type        = string
  default     = "129"
}

## environment variables

variable "env_var" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default = {
    var1 = "val1"
    var2 = "val2"
  }

}

## Create Variable for Lambda Function Tags
variable "my_lambda_tags" {
  description = "Tags to set on the lambda"
  type        = map(string)
  default = {
    Application = "Push"
    Environment = "Demo"
  }

}
