module "cicd" {
  source     = "../modules/codepipeline"
  depends_on = [module.lambda]
}

module "lambda" {
  source                  = "../modules/lambda"
  aws_region              = var.aws_region
  function_configurations = var.function_configurations_1
}
