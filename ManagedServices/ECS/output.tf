output "cluster_arn" {
  value = module.ecs-cluster.cluster_arn
}



output "service_name" {
  value = module.ecs-service.service_name
}
