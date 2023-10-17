module "cloudfront" {
  source                    = "../cloudfront"
  cloudfront_configurations = var.cloudfront_configurations
  origin_domain_name        = module.s3.bucket_regional_domain_name
  origin_id                 = module.s3.bucket_id
  tags                      = var.tags
}

module "s3" {
  source             = "../s3"
  s3_configurations  = var.s3_configurations
  cf_source_arn      = module.cloudfront.distribution_arn
  origin_domain_name = module.s3.bucket_regional_domain_name
  origin_id          = module.s3.bucket_id
  tags               = var.tags
}
