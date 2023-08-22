module "apigw_lambda" {
  source     = "./modules/apigw-lambda"
  aws_region = var.aws_region
  count      = var.apigw_lambda_count

  # variables for apigw
  apigw_name    = var.apigw_name[count.index]
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key[count.index]
  usage_plan    = var.usage_plan[count.index]

  # variables for lambda
  function_name = var.function_name[count.index]
  iam_role_name = var.iam_role_name[count.index]
  runtime       = var.runtime
  handler       = var.handler
  memory        = var.memory
  env_var       = var.env_var[count.index]
  tags          = var.my_lambda_tags[count.index]
}
