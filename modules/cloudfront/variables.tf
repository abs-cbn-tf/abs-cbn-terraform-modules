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
