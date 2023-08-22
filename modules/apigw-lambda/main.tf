module "lambda_function" {
  source     = "../lambda" # Mandatory
  aws_region = var.aws_region

  function_name  = var.function_name
  iam_role_name  = var.iam_role_name
  runtime        = var.runtime
  handler        = var.handler
  memory         = var.memory
  env_var        = var.env_var
  my_lambda_tags = var.my_lambda_tags

  lambda_count = var.lambda_count
}

module "apigw" {
  source        = "../apigw" # Mandatory
  aws_region    = var.aws_region
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan

  lambda_invoke_arn = module.lambda_function.invoke_arn
  function_name     = module.lambda_function.name

  apigw_count = var.apigw_count
}

