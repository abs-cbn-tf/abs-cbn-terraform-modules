module "lambda_function" {
  source                  = "../lambda" # Mandatory
  aws_region              = var.aws_region
  function_configurations = var.function_configurations
}

module "apigw" {
  source               = "../apigw"
  aws_region           = var.aws_region
  apigw_configurations = var.apigw_configurations

  apigw_lambda_invoke_arn = module.lambda_function.invoke_arn
  apigw_function_name     = module.lambda_function.name
}

