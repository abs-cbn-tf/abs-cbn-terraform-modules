variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
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
