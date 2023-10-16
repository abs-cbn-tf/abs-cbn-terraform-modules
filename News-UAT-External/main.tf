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
  alb_configurations = var.alb_configurations
  subnets            = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  # security_groups     = [module.push-web-ecs-service-sg.security_group_id]
  ecs_security_groups = [module.news-web-sg.security_group_id]
  vpc_id              = module.vpc.vpc_id

  # cluster
  tf_capacity_provider = var.tf_capacity_provider
  tf_my_cluster        = var.tf_my_cluster

  # service
  task_family    = var.task_family
  task_role_name = var.task_role_name
  task_cpu       = var.task_cpu
  task_memory    = var.task_memory
  network_mode   = var.network_mode

  repositories = var.repositories

  # container_definitions = var.container_definitions
  container_name = var.container_name
  # container_image    = var.container_image
  container_cpu      = var.container_cpu
  container_memory   = var.container_memory
  container_cport    = var.container_cport
  container_hport    = var.container_hport
  container_protocol = var.container_protocol

  requires_compatibilities = var.requires_compatibilities
  operating_system         = var.operating_system
  cpu_architecture         = var.cpu_architecture

  # service 
  service_name      = var.service_name
  service_role_name = var.service_role_name
  ecs_lb_cport      = var.ecs_lb_cport
  tags              = var.global_tags

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

  tags = var.global_tags
}
