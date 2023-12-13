# MODULES FOR LAMBDAS WITH APIGW TRIGGER
module "apigw-lambda-1" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_1
  apigw_configurations    = var.apigw_configurations_1
  tags                    = var.global_tags
}
module "apigw-lambda-2" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_2
  apigw_configurations    = var.apigw_configurations_2
  tags                    = var.global_tags
}
module "apigw-lambda-3" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_3
  apigw_configurations    = var.apigw_configurations_3
  tags                    = var.global_tags
}
module "apigw-lambda-4" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_4
  apigw_configurations    = var.apigw_configurations_4
  tags                    = var.global_tags
}

module "cloudfront_s3_1" {
  source                    = "../modules/cloudfront-s3"
  cloudfront_configurations = var.cloudfront_configurations_1
  s3_configurations         = var.s3_configurations_1
  tags                      = var.global_tags
}

module "cloudfront_s3_2" {
  source                    = "../modules/cloudfront-s3"
  cloudfront_configurations = var.cloudfront_configurations_2
  s3_configurations         = var.s3_configurations_2
  tags                      = var.global_tags
}

module "cloudfront_s3_3" {
  source                    = "../modules/cloudfront-s3"
  cloudfront_configurations = var.cloudfront_configurations_3
  s3_configurations         = var.s3_configurations_3
  tags                      = var.global_tags
}
