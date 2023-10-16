variable "aws_region" {}
variable "profile" {}
# FOR LAMBDAS WITH APIGW TRIGGER
variable "apigw_function_configurations_1" {
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

variable "apigw_configurations_1" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
    apigw_tags    = map(string)
  })
}

variable "apigw_function_configurations_2" {
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

variable "apigw_configurations_2" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
    apigw_tags    = map(string)
  })
}

variable "apigw_function_configurations_3" {
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

variable "apigw_configurations_3" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
    apigw_tags    = map(string)
  })
}

variable "apigw_function_configurations_4" {
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

variable "apigw_configurations_4" {
  description = "Map of APIGW configurations"
  type = object({
    apigw_name    = string
    resource_name = string
    method_name   = string
    stage_name    = string
    api_key       = string
    usage_plan    = string
    apigw_tags    = map(string)
  })
}
# LAMBDA ONLY
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

# cloudfront-s3
variable "bucket_name_1" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "tags_1" {
  description = "The tags to assign to the S3 bucket"
  type        = map(string)
}

variable "bucket_name_2" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "tags_2" {
  description = "The tags to assign to the S3 bucket"
  type        = map(string)
}

variable "bucket_name_3" {
  description = "The name of the S3 bucket"
  type        = string
}
variable "tags_3" {
  description = "The tags to assign to the S3 bucket"
  type        = map(string)
}

# GLOBAL TAGGINGS
variable "global_tags" {
  description = "Global tags for all resources"
  # type        = map(string)
  type = object(
    {
      g1 = string
      g2 = string
    }
  )
}

variable "individual_tags" {
  description = "Individual tags for specific modules"
  type        = map(map(string))
  default = {
    function_1 = {
      # kentico-news-service-lambda
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-1 = {
      # imp-news-wb-lite-api
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-2 = {
      # imp-news-image-upload
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-3 = {
      # imp-news-image
      k1 = "v1"
      k2 = "v2"
    }
    apigw-lambda-4 = {
      # imp-news-pcm-api
      k1 = "v1"
      k2 = "v2"
    }
    cloudfront_s3_1 = {
      k1 = "cf1"
      k2 = "v2"
    }
    cloudfront_s3_2 = {
      k1 = "cf2"
      k2 = "v2"
    }
    cloudfront_s3_3 = {
      k1 = "cf3"
      k2 = "v2"
    }
    // Add more individual tags for other modules as needed
  }
}

# variable "repositories" {
#   description = "A list of ECR repository names to be created"
#   type        = string
#   #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
#   default = "push-web"
# }
