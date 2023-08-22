module "alb-tg" {
  source = "../../Iaas/alb"
}

module "ecs-cluster" {
  source               = "./modules/ecs-cluster"
  tf_capacity_provider = var.tf_capacity_provider
  tf_my_cluster        = var.tf_my_cluster
}

module "ecs-service" {
  source = "./modules/ecs-service"
  # taskdef
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
  tf_my_cluster     = var.tf_my_cluster
  # network
  public_subnets = var.public_subnets

  tg_arn = module.alb-tg.target_group_arn

  cluster_arn = module.ecs-cluster.cluster_arn
}
