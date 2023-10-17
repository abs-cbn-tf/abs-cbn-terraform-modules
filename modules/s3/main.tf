resource "aws_s3_bucket" "site_origin" {
  bucket = var.s3_configurations.bucket_name
  tags   = merge(var.tags, var.s3_configurations.bucket_tags)
}

resource "aws_s3_bucket_public_access_block" "site_origin" {
  bucket                  = aws_s3_bucket.site_origin.bucket
  block_public_acls       = var.s3_configurations.block_public_acls
  block_public_policy     = var.s3_configurations.block_public_policy
  ignore_public_acls      = var.s3_configurations.ignore_public_acls
  restrict_public_buckets = var.s3_configurations.restrict_public_buckets
}

resource "aws_s3_bucket_server_side_encryption_configuration" "site_origin" {
  bucket = aws_s3_bucket.site_origin.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3_configurations.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_versioning" "site_origin" {
  bucket = aws_s3_bucket.site_origin.bucket

  versioning_configuration {
    status = var.s3_configurations.bucket_versioning
  }
}

resource "aws_s3_object" "content" {
  depends_on = [
    aws_s3_bucket.site_origin
  ]

  bucket                 = aws_s3_bucket.site_origin.bucket
  key                    = var.s3_configurations.key
  source                 = var.s3_configurations.source
  server_side_encryption = var.s3_configurations.server_side_encryption
  content_type           = var.s3_configurations.content_type
}

resource "aws_s3_bucket_policy" "site_origin" {
  depends_on = [
    data.aws_iam_policy_document.site_origin
  ]
  bucket = aws_s3_bucket.site_origin.id
  policy = data.aws_iam_policy_document.site_origin.json
}

data "aws_iam_policy_document" "site_origin" {
  #  depends_on = [
  #    aws_cloudfront_distribution.site_access,
  #    aws_s3_bucket.site_origin
  #  ]

  statement {
    sid    = "AllowCloudFrontPrivateContent"
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
      values   = [var.cf_source_arn]
    }
  }
}





