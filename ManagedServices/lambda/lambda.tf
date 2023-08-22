module "lambda_function" {
  source     = "./modules" # Mandatory
  aws_region = var.aws_region

  function_name = var.function_name
  iam_role_name = var.iam_role_name
  runtime       = var.runtime
  handler       = var.handler
  memory        = var.memory
  env_var       = var.env_var
  tags          = var.my_lambda_tags
}

