# MODULES FOR LAMBDAS WITH APIGW TRIGGER
module "apigw-lambda-1" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_1
  apigw_configurations    = var.apigw_configurations_1
  tags                    = merge(var.global_tags, var.individual_tags.apigw-lambda-1)
}
module "apigw-lambda-2" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_2
  apigw_configurations    = var.apigw_configurations_2
  tags                    = merge(var.global_tags, var.individual_tags.apigw-lambda-2)
}
module "apigw-lambda-3" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_3
  apigw_configurations    = var.apigw_configurations_3
  tags                    = merge(var.global_tags, var.individual_tags.apigw-lambda-3)
}
module "apigw-lambda-4" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_4
  apigw_configurations    = var.apigw_configurations_4
  tags                    = merge(var.global_tags, var.individual_tags.apigw-lambda-4)
}
module "function_1" {
  source                  = "../modules/lambda"
  aws_region              = var.aws_region
  function_configurations = var.function_configurations_1
  tags                    = merge(var.global_tags, var.individual_tags.function_1)
}

module "cloudfront-s3-1" {
  source      = "../modules/cloudfront-s3"
  bucket_name = var.bucket_name_1
  tags        = merge(var.global_tags, var.individual_tags.cloudfront_s3_1)
}
module "cloudfront-s3-2" {
  source      = "../modules/cloudfront-s3"
  bucket_name = var.bucket_name_2
  tags        = merge(var.global_tags, var.individual_tags.cloudfront_s3_2)
}
module "cloudfront-s3-3" {
  source      = "../modules/cloudfront-s3"
  bucket_name = var.bucket_name_3
  tags        = merge(var.global_tags, var.individual_tags.cloudfront_s3_3)
}
