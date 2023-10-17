module "alb" {
  source              = "../alb"
  alb_configurations  = var.alb_configurations
  subnets             = var.subnets
  ecs_security_groups = var.ecs_security_groups
  vpc_id              = var.vpc_id
  tags                = var.tags
}

module "ecs-cluster" {
  source                 = "../ECS/ecs-cluster"
  cluster_configurations = var.cluster_configurations
  tags                   = var.tags
}

module "ecs-service" {
  source = "../ECS/ecs-service"

  taskdef_configurations = var.taskdef_configurations
  service_configurations = var.service_configurations

  # network
  subnets             = var.subnets
  ecs_security_groups = var.ecs_security_groups

  cluster_arn = module.ecs-cluster.cluster_arn
  alb_tg_arn  = module.alb.target_group_arn

  repositories = var.repositories
  tags         = var.tags
}
