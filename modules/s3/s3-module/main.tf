variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the S3 bucket"
  type        = map(string)
  default     = {}  # By default, it's an empty map (no tags). You can change this if needed.
}



resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

# ... other S3 related resources ...

