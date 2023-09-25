resource "aws_ecs_cluster" "my_cluster" {
  name = var.tf_my_cluster
}

resource "aws_ecs_cluster_capacity_providers" "my_cluster" {
  cluster_name = aws_ecs_cluster.my_cluster.name

  capacity_providers = ["${var.tf_capacity_provider}"]

  default_capacity_provider_strategy {
    base              = 0
    weight            = 1
    capacity_provider = var.tf_capacity_provider
  }
}

resource "aws_ecr_repository" "example" {
  name                 = "my-app-repository" # Name of the repository
  image_tag_mutability = "MUTABLE"           # Or "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = false # Enables image scanning on push
  }
}


output "repository_url" {
  value = aws_ecr_repository.example.repository_url
}

