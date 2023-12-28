
module "ecs-alb" {
  depends_on = [module.vpc, module.afi-web-sg, module.afi-web-ecs-service-sg]
  source     = "../modules/ecs-alb"
  # alb
  alb_configurations  = var.alb_configurations
  subnets             = [module.vpc.public_subnet_az1_id, module.vpc.public_subnet_az2_id]
  ecs_security_groups = [module.afi-web-sg.security_group_id]
  vpc_id              = module.vpc.vpc_id

  # ECS
  service_subnets        = [module.vpc.private_app_subnet_az1_id, module.vpc.private_app_subnet_az2_id]
  cluster_configurations = var.cluster_configurations
  taskdef_configurations = var.taskdef_configurations
  service_configurations = var.service_configurations

  repositories = var.repositories
  tags         = var.global_tags

}
module "afi-web-sg" {
  depends_on        = [module.vpc]
  source            = "../modules/sg"
  sg_configurations = var.sg_configurations_1
  vpc_id            = module.vpc.vpc_id
  tags              = var.global_tags
}
module "afi-web-ecs-service-sg" {
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


module "cloudfront_s3_1" {
  source                    = "../modules/cloudfront-s3"
  cloudfront_configurations = var.cloudfront_configurations_1
  s3_configurations         = var.s3_configurations_1
  tags                      = var.global_tags
}
