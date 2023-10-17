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
}


variable "origin_domain_name" {
  description = "The domain name of the S3 bucket origin"
  type        = string
}

variable "origin_id" {
  description = "The ID of the S3 bucket origin"
  type        = string
}

variable "cf_source_arn" {
  description = "Cloudfront source ARN"
  type        = string
}
