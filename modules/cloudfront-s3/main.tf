module "cloudfront" {
  source             = "../cloudfront"
  origin_domain_name = module.s3.bucket_regional_domain_name
  origin_id          = module.s3.bucket_id
  tags               = var.tags
}

module "s3" {
  source             = "../s3"
  bucket_name        = var.bucket_name
  cf_source_arn      = module.cloudfront.distribution_arn
  origin_domain_name = module.s3.bucket_regional_domain_name
  origin_id          = module.s3.bucket_id
  tags               = var.tags
}
