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

variable "apigw_lambda_count" {
  description = "Amount of time the module is going to be applied"
  type        = number
  default     = 2
}

# Variables for APIGW
variable "apigw_name" {
  description = "Name for apigw"
  type        = list(string)
  default     = ["imp-content-api-apigw", "imp-page-api-apigw"]
}

variable "resource_name" {
  description = "Name for the resource"
  type        = string
  default     = "{proxy+}"
}

variable "method_name" {
  description = "Name for the method"
  type        = string
  default     = "ANY"
}

variable "stage_name" {
  description = "Name for stage"
  type        = string
  default     = "dev"
}

variable "api_key" {
  description = "Name for api key"
  type        = list(string)
  default     = ["imp-content-api-apigw-api-key", "imp-page-api-apigw-api-key"]
}

variable "usage_plan" {
  description = "Name for usage plan"
  type        = list(string)
  default     = ["imp-content-api-apigw-usage-plan", "imp-page-api-apigw-usage-plan"]
}

# Variables for lambda
variable "function_name" {
  type    = list(string)
  default = ["imp-content-api", "imp-page-api"]
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
  type        = list(string)
  default     = ["imp-content-api-role", "imp-page-api-role"]
}

variable "memory" {
  description = "Memory size for the lambda"
  type        = string
  default     = "129"
}

## environment variables

variable "env_var" {
  description = "Tags to set on the lambda"
  type        = list(map(string))
  default = [
    # for the lambda 1
    {
      var1 = "val1"
      var2 = "val2"
    },
    # for the lambda 2
    {
      var3 = "val3"
      var4 = "val4"
    }
  ]
}

## Create Variable for Lambda Function Tags
variable "my_lambda_tags" {
  description = "Tags to set on the lambda"
  type        = list(map(string))
  default = [
    # for the lambda 1
    {
      Project     = "IMP"
      Environment = "UAT"
    },
    # for the lambda 2
    {
      Project     = "IMP"
      Environment = "DEV"
    }
  ]
}
