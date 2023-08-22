# using lambda directory to fetch the outputs from lambda
module "lambda" {
  source = "../lambda"
}

module "apigw_lambda" {
  source        = "./modules/apigw-lambda" # Mandatory
  aws_region    = var.aws_region
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan

  # using module output as input
  lambda_invoke_arn    = module.lambda.invoke_arn
  lambda_function_name = module.lambda.lambda_name
}


