# resources on a single main.tf
module "lambda" {
  source         = "./modules/lambda"
  aws_region     = var.aws_region
  function_name  = var.lambda_function_name
  iam_role_name  = var.lambda_iam_role_name
  runtime        = var.lambda_runtime
  handler        = var.lambda_handler
  memory         = var.lambda_memory
  env_var        = var.lambda_env_var
  my_lambda_tags = var.lambda_function_tags

  lambda_count = var.lambda_function_count
}
module "apigw-lambda" {
  source        = "./modules/apigw-lambda"
  aws_region    = var.aws_region
  function_name = var.function_name

  # variables for lambda
  iam_role_name = var.iam_role_name
  runtime       = var.runtime
  handler       = var.handler

  memory         = var.memory
  env_var        = var.env_var
  my_lambda_tags = var.my_lambda_tags

  # variables for apigw
  apigw_name    = var.apigw_name
  resource_name = var.resource_name
  method_name   = var.method_name
  stage_name    = var.stage_name
  api_key       = var.api_key
  usage_plan    = var.usage_plan

  lambda_count = var.lambda_count
  apigw_count  = var.apigw_count
}

module "ecs-alb" {
  depends_on = [module.vpc, module.push-web-sg, module.push-web-ecs-service-sg]
  source     = "./modules/ecs-alb"
  # alb
  alb_name            = var.alb_name
  subnets             = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  security_groups     = [module.push-web-ecs-service-sg.security_group_id]
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

}
module "push-web-ecs-service-sg" {
  depends_on  = [module.vpc]
  source      = "./modules/sg"
  description = "push-web-ecs-service-sg"

  ingress_rules = [
    {
      from_port   = var.ecs_sg_ingress_from
      to_port     = var.ecs_sg_ingress_to
      protocol    = var.ecs_sg_ingress_protocol
      cidr_blocks = [var.ecs_sg_ingress_cidr]
      self        = false
    }
  ]

  egress_rules = [
    {
      from_port   = var.ecs_sg_egress_from
      to_port     = var.ecs_sg_egress_to
      protocol    = var.ecs_sg_egress_protocol
      cidr_blocks = [var.ecs_sg_egress_cidr]
      self        = false
    }
  ]

  name = "push-web-ecs-service-sg"
  tags = {
    Backup               = "False"
    OwnerTeamEmail       = "mardelacruz@abs-cbn.com"
    "abscbn-bus-unit"    = "DCT"
    "abscbn-cost-centre" = "61250"
    "abscbn-criticality" = "Silver"
    "abscbn-env"         = "prod"
    "abscbn-product"     = "ent"
    "abscbn-url"         = "pushweb.abs-cbn.com"
    "Name"               = "push-web-ecs-service-sg"
  }
  vpc_id = module.vpc.vpc_id
}

module "push-web-sg" {
  depends_on  = [module.vpc]
  source      = "./modules/sg"
  description = "push-web-sg"

  ingress_rules = [
    {
      from_port   = var.web_sg_ingress_from
      to_port     = var.web_sg_ingress_to
      protocol    = var.web_sg_ingress_protocol
      cidr_blocks = [var.web_sg_ingress_cidr]
      self        = false
    }
  ]

  egress_rules = [
    {
      from_port   = var.web_sg_egress_from
      to_port     = var.web_sg_egress_to
      protocol    = var.web_sg_egress_protocol
      cidr_blocks = [var.web_sg_egress_cidr]
      self        = false
    }
  ]

  name = "push-web-sg"
  tags = {
    Backup               = "False"
    OwnerTeamEmail       = "mardelacruz@abs-cbn.com"
    "abscbn-bus-unit"    = "DCT"
    "abscbn-cost-centre" = "61250"
    "abscbn-criticality" = "Silver"
    "abscbn-env"         = "prod"
    "abscbn-product"     = "ent"
    "abscbn-url"         = "pushweb.abs-cbn.com"
    "Name" = "push-web-sg"
  }
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source                       = "./modules/vpc"
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

module "cloudfront-s3" {
  source      = "./modules/cloudfront-s3"
  bucket_name = var.bucket_name
  tags        = var.tags
}
