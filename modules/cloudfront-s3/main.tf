module "s3" {
  source             = "../s3"
  bucket_name        = var.bucket_name
  tags               = var.tags
  origin_domain_name = module.s3.bucket_domain_name
  origin_id          = module.s3.bucket_id
}

module "cloudfront" {
  source             = "../cloudfront"
  origin_domain_name = module.s3.bucket_domain_name
  origin_id          = module.s3.bucket_id
  tags = var.tags
}

output "bucket_id" {
  value = module.s3.bucket_id
}

output "bucket_domain_name" {
  value = module.s3.bucket_domain_name
}

#output "cloudfront_domain_name" {
#  value = module.cloudfront.cloudfront_domain_name
#}

output "distribution_domain_name" {
  value = module.cloudfront.distribution_domain_name
}

