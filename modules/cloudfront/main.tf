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

resource "random_id" "oac_id" {
  byte_length = 8
}

resource "aws_cloudfront_origin_access_control" "site_access" {
  name                              = "security_cf_s3_oac1-${random_id.oac_id.hex}"
  description                       = "Example Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "site_access" {
  depends_on = [
    aws_cloudfront_origin_access_control.site_access
  ]

  enabled             = true
  default_root_object = "index.html"
  tags = var.tags
  # Rest of the CloudFront configuration...
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  origin {
    domain_name              = var.origin_domain_name
    origin_id                = var.origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.site_access.id
  }
}

output "distribution_domain_name" {
  value = aws_cloudfront_distribution.site_access.domain_name
}


output "distribution_arn" {
  value = aws_cloudfront_distribution.site_access.arn
}

