# MODULES FOR LAMBDAS WITH EVENTS TRIGGER
module "eventbridge-lambda-2" {
  source                    = "../modules/eventbridge-lambda"
  aws_region                = var.aws_region
  function_configurations   = var.events_function_configurations_2
  eventbridge_configuration = var.eventbridge_configuration_2
  tags                      = var.global_tags

}
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

module "function_1" {
  source                  = "../modules/lambda"
  aws_region              = var.aws_region
  function_configurations = var.function_configurations_1
  tags                    = var.global_tags
}

module "ecs-alb" {
  depends_on = [module.vpc, module.news-web-sg, module.news-web-ecs-service-sg]
  source     = "../modules/ecs-alb"
  # alb
  alb_configurations  = var.alb_configurations
  subnets             = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  ecs_security_groups = [module.news-web-sg.security_group_id]
  vpc_id              = module.vpc.vpc_id

  # ECS
  cluster_configurations = var.cluster_configurations
  taskdef_configurations = var.taskdef_configurations
  service_configurations = var.service_configurations

  repositories = var.repositories
  tags         = var.global_tags

}
module "news-web-sg" {
  depends_on        = [module.vpc]
  source            = "../modules/sg"
  sg_configurations = var.sg_configurations_1
  vpc_id            = module.vpc.vpc_id
  tags              = var.global_tags
}
module "news-web-ecs-service-sg" {
  depends_on        = [module.vpc]
  source            = "../modules/sg"
  sg_configurations = var.sg_configurations_2
  vpc_id            = module.vpc.vpc_id
  tags              = var.global_tags
}



module "vpc" {
  source                       = "../modules/vpc"
  region                       = var.aws_region
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
  public_subnet_az1            = var.public_subnet_az1_abs
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  public_subnet_az2            = var.public_subnet_az2_abs
  private_data_subnet_az1      = var.private_data_subnet_az1_abs
  private_data_subnet_az2      = var.private_data_subnet_az2_abs
  private_app_subnet_az2       = var.private_app_subnet_az2_abs
  private_app_subnet_az1       = var.private_app_subnet_az1_abs

  tags = merge(var.global_tags, var.individual_tags.vpc)
}
