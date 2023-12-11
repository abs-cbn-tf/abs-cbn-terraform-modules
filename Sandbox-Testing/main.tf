module "cicd" {
  source                            = "../modules/codepipeline"
  codepipeline_source_configuration = var.codepipeline_source_configuration
  codepipeline_build_configuration  = var.codepipeline_build_configuration
  include_deploy_stage              = var.include_deploy_stage
  depends_on                        = [module.lambda]
}

module "lambda" {
  source                  = "../modules/lambda"
  aws_region              = var.aws_region
  function_configurations = var.function_configurations_1
}
