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

variable "s3_configurations" {
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

variable "tags" {
  description = "The tags to assign to the S3 bucket"
  type        = map(string)
  default     = {}
}

