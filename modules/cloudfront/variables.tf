variable "cloudfront_configurations" {
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

variable "origin_domain_name" {
  description = "The domain name of the S3 bucket used as the CloudFront origin"
  type        = string
}

variable "origin_id" {
  description = "The ID of the S3 bucket used as the CloudFront origin"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
