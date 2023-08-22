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

module "cloudfront" {
  source = "../cloudfront"

  origin_domain_name = var.origin_domain_name
  origin_id          = var.origin_id
}

resource "aws_s3_bucket" "site_origin" {
  bucket = var.bucket_name
  tags   = var.tags
}

resource "aws_s3_bucket_public_access_block" "site_origin" {
  bucket                  = aws_s3_bucket.site_origin.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "site_origin" {
  bucket = aws_s3_bucket.site_origin.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "site_origin" {
  bucket = aws_s3_bucket.site_origin.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "content" {
  depends_on = [
    aws_s3_bucket.site_origin
  ]

  bucket                 = aws_s3_bucket.site_origin.bucket
  key                    = "index.html"
  source                 = "./index.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
}

resource "aws_s3_bucket_policy" "site_origin" {
  depends_on = [
    data.aws_iam_policy_document.site_origin
  ]
  bucket = aws_s3_bucket.site_origin.id
  policy = data.aws_iam_policy_document.site_origin.json
}

#data "aws_iam_policy_document" "site_origin" {
#  statement {
#    sid    = "s3_cloudfront_status_website"
#    effect = "Allow"
#
#    actions = [
#      "s3:GetObject"
#    ]
#
#    principals {
#      identifiers = ["cloudfront.amazonaws.com"]
#      type        = "Service"
#    }

#    resources = [
#      "arn:aws:s3:::${aws_s3_bucket.site_origin.bucket}/*"
#    ]

#    condition {
#      test     = "StringEquals"
#      variable = "AWS:SourceArn"
#      #values   = [aws_cloudfront_distribution.site_access.arn]
#      values   = [module.cloudfront.distribution_arn]
#    }
#  }
#}

data "aws_iam_policy_document" "site_origin" {
#  depends_on = [
#    aws_cloudfront_distribution.site_access,
#    aws_s3_bucket.site_origin
#  ]

  statement {
    sid    = "s3_cloudfront_status_website"
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    principals {
      identifiers = ["cloudfront.amazonaws.com"]
      type        = "Service"
    }

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.site_origin.bucket}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [module.cloudfront.distribution_arn]
    }
  }
}



output "bucket_id" {
  value = aws_s3_bucket.site_origin.id
}

output "bucket_domain_name" {
  value = aws_s3_bucket.site_origin.bucket_domain_name
}

output "bucket" {
  value = aws_s3_bucket.site_origin
}

