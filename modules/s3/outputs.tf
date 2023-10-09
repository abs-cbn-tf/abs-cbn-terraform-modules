output "bucket_id" {
  value = aws_s3_bucket.site_origin.id
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.site_origin.bucket_regional_domain_name
}

output "bucket" {
  value = aws_s3_bucket.site_origin
}
