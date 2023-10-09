output "service_name" {
  value = aws_ecs_service.ecs_service.name
}

output "repo_url" {
  value = aws_ecr_repository.example.repository_url
}
