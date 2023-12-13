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

# cloudfront-s3
variable "cloudfront_configurations_1" {
  type = object({
    # random ID
    byte_length = number
    # origin access
    origin_access_description = string # "News Origin Access"
    origin_access_type        = string # "s3"
    origin_signing_behavior   = string # "always"
    origin_signing_protocol   = string # "sigv4"
    # distribution 
    distribution_enabled   = bool         # true
    default_root_object    = string       # index.html
    allowed_methods        = list(string) # ["GET", "HEAD"]
    cached_methods         = list(string) # ["GET", "HEAD"]
    viewer_protocol_policy = string       # "allow-all"
    distribution_tags      = map(string)
  })
}

variable "s3_configurations_1" {
  type = object({
    # bucket
    bucket_name = string
    # block public access
    block_public_acls       = bool #true 
    block_public_policy     = bool #true 
    ignore_public_acls      = bool #true  
    restrict_public_buckets = bool #true 
    # s3 encryption
    sse_algorithm = string #"AES256"
    # bucket versioning
    bucket_versioning = string #"Enabled"
    #s3 object
    key                    = string #"index.html"
    source                 = string #"./index.html"
    server_side_encryption = string #"AES256"
    content_type           = string #"text/html"
    # taggings
    bucket_tags = map(string)
  })
}

variable "cloudfront_configurations_2" {
  type = object({
    # random ID
    byte_length = number
    # origin access
    origin_access_description = string # "News Origin Access"
    origin_access_type        = string # "s3"
    origin_signing_behavior   = string # "always"
    origin_signing_protocol   = string # "sigv4"
    # distribution 
    distribution_enabled   = bool         # true
    default_root_object    = string       # index.html
    allowed_methods        = list(string) # ["GET", "HEAD"]
    cached_methods         = list(string) # ["GET", "HEAD"]
    viewer_protocol_policy = string       # "allow-all"
    distribution_tags      = map(string)
  })
}

variable "s3_configurations_2" {
  type = object({
    # bucket
    bucket_name = string
    # block public access
    block_public_acls       = bool #true 
    block_public_policy     = bool #true 
    ignore_public_acls      = bool #true  
    restrict_public_buckets = bool #true 
    # s3 encryption
    sse_algorithm = string #"AES256"
    # bucket versioning
    bucket_versioning = string #"Enabled"
    #s3 object
    key                    = string #"index.html"
    source                 = string #"./index.html"
    server_side_encryption = string #"AES256"
    content_type           = string #"text/html"
    # taggings
    bucket_tags = map(string)
  })
}
variable "cloudfront_configurations_3" {
  type = object({
    # random ID
    byte_length = number
    # origin access
    origin_access_description = string # "News Origin Access"
    origin_access_type        = string # "s3"
    origin_signing_behavior   = string # "always"
    origin_signing_protocol   = string # "sigv4"
    # distribution 
    distribution_enabled   = bool         # true
    default_root_object    = string       # index.html
    allowed_methods        = list(string) # ["GET", "HEAD"]
    cached_methods         = list(string) # ["GET", "HEAD"]
    viewer_protocol_policy = string       # "allow-all"
    distribution_tags      = map(string)
  })
}

variable "s3_configurations_3" {
  type = object({
    # bucket
    bucket_name = string
    # block public access
    block_public_acls       = bool #true 
    block_public_policy     = bool #true 
    ignore_public_acls      = bool #true  
    restrict_public_buckets = bool #true 
    # s3 encryption
    sse_algorithm = string #"AES256"
    # bucket versioning
    bucket_versioning = string #"Enabled"
    #s3 object
    key                    = string #"index.html"
    source                 = string #"./index.html"
    server_side_encryption = string #"AES256"
    content_type           = string #"text/html"
    # taggings
    bucket_tags = map(string)
  })
}


# GLOBAL TAGGINGS
variable "global_tags" {
  description = "Global tags for all resources"
  # type        = map(string)
  type = object(
    {
      global_tag = string
    }
  )
}

# variable "repositories" {
#   description = "A list of ECR repository names to be created"
#   type        = string
#   #  default     = ["migration-middleware", "workbench-api", "workbench-web"]
#   default = "push-web"
# }
