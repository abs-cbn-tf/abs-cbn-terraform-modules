module "alb" {
  source              = "../alb"
  alb_name            = var.alb_name
  subnets             = var.subnets
  ecs_security_groups = var.ecs_security_groups
  listener_port       = var.listener_port
  target_group_name   = var.target_group_name
  target_group_port   = var.target_group_port
  vpc_id              = var.vpc_id
  tags                = var.tags
}

module "ecs-cluster" {
  source               = "../ECS/ecs-cluster"
  tf_capacity_provider = var.tf_capacity_provider
  tf_my_cluster        = var.tf_my_cluster
  tags                 = var.tags
}

module "ecs-service" {
  source = "../ECS/ecs-service"
  # taskdef
  ecs_security_groups = var.ecs_security_groups
  task_family         = var.task_family
  task_role_name      = var.task_role_name
  task_cpu            = var.task_cpu
  task_memory         = var.task_memory
  network_mode        = var.network_mode

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
  tf_my_cluster     = var.tf_my_cluster
  # network
  subnets = var.subnets

  cluster_arn  = module.ecs-cluster.cluster_arn
  alb_tg_arn   = module.alb.target_group_arn
  ecs_lb_cport = var.ecs_lb_cport
  tags         = var.tags
  repositories = var.repositories
}
