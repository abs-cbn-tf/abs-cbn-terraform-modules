# MODULES FOR LAMBDAS WITH EVENTS TRIGGER
module "eventbridge-lambda-2" {
  source                    = "../modules/eventbridge-lambda"
  aws_region                = var.aws_region
  function_configurations   = var.events_function_configurations_2
  eventbridge_configuration = var.eventbridge_configuration_2
}
# MODULES FOR LAMBDAS WITH APIGW TRIGGER
module "apigw-lambda-1" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_1
  apigw_configurations    = var.apigw_configurations_1
  tags                    = merge(var.global_tags, var.individual_tags.apigw-lambda-1)
}
module "apigw-lambda-2" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_2
  apigw_configurations    = var.apigw_configurations_2
}
module "apigw-lambda-3" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_3
  apigw_configurations    = var.apigw_configurations_3
}
module "apigw-lambda-4" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_4
  apigw_configurations    = var.apigw_configurations_4
}
module "apigw-lambda-5" {
  source                  = "../modules/apigw-lambda"
  aws_region              = var.aws_region
  function_configurations = var.apigw_function_configurations_5
  apigw_configurations    = var.apigw_configurations_5
}
module "function_1" {
  source                  = "../modules/lambda"
  aws_region              = var.aws_region
  function_configurations = var.function_configurations_1
}
module "ecs-alb" {
  depends_on = [module.vpc, module.push-web-sg, module.push-web-ecs-service-sg]
  source     = "../modules/ecs-alb"
  # alb
  alb_name = var.alb_name
  subnets  = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  # security_groups     = [module.push-web-ecs-service-sg.security_group_id]
  ecs_security_groups = [module.push-web-sg.security_group_id]
  listener_port       = var.listener_port
  target_group_name   = var.target_group_name
  target_group_port   = var.target_group_port
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

  # container_definitions = var.container_definitions
  container_name     = var.container_name
  container_image    = var.container_image
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
  tags              = merge(var.global_tags, var.individual_tags.ecs_alb)
  repositories      = var.repositories
}
module "push-web-ecs-service-sg" {
  depends_on  = [module.vpc]
  source      = "../modules/sg"
  name        = "news-web-ecs-service-sg"
  description = "news-web-ecs-service-sg"

  vpc_id = module.vpc.vpc_id

  ingress_rules = var.ingress_rules_1
  egress_rules  = var.egress_rules_1

  tags = merge(var.global_tags, var.individual_tags.push-web-ecs-service-sg)
}

module "push-web-sg" {
  depends_on  = [module.vpc]
  source      = "../modules/sg"
  name        = "news-web-sg"
  description = "news-web-sg"

  vpc_id = module.vpc.vpc_id

  ingress_rules = var.ingress_rules_2
  egress_rules  = var.egress_rules_2
  tags          = merge(var.global_tags, var.individual_tags.push-web-sg)
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

  vpc_tags = var.vpc_tags
}
