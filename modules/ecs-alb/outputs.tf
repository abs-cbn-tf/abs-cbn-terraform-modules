output "lb_dns_name" {
  value = module.alb.lb_dns_name
}

output "repo_url" {
  value = module.ecs-service.repo_url
}
