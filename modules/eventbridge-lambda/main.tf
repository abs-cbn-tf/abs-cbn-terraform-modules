module "lambda" {
  source                  = "../lambda"
  aws_region              = var.aws_region
  function_configurations = var.function_configurations
  tags                    = var.tags
}

module "eventbridge" {
  source                    = "../eventbridge"
  eventbridge_configuration = var.eventbridge_configuration

  target_id  = module.lambda.name
  target_arn = module.lambda.arn
  tags       = var.tags
}
