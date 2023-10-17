resource "random_id" "oac_id" {
  byte_length = 8
}

resource "aws_cloudfront_origin_access_control" "site_access" {
  name                              = "security_cf_s3_oac1-${random_id.oac_id.hex}"
  description                       = var.cloudfront_configurations.origin_access_description
  origin_access_control_origin_type = var.cloudfront_configurations.origin_access_type
  signing_behavior                  = var.cloudfront_configurations.origin_signing_behavior
  signing_protocol                  = var.cloudfront_configurations.origin_signing_protocol
}

resource "aws_cloudfront_distribution" "site_access" {
  depends_on = [
    aws_cloudfront_origin_access_control.site_access
  ]

  enabled             = var.cloudfront_configurations.distribution_enabled
  default_root_object = var.cloudfront_configurations.default_root_object
  tags                = merge(var.tags, var.cloudfront_configurations.distribution_tags)
  # Rest of the CloudFront configuration...
  default_cache_behavior {
    allowed_methods        = var.cloudfront_configurations.allowed_methods
    cached_methods         = var.cloudfront_configurations.cached_methods
    target_origin_id       = var.origin_id
    viewer_protocol_policy = var.cloudfront_configurations.viewer_protocol_policy

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

