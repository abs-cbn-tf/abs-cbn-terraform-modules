resource "aws_ecs_cluster" "my_cluster" {
  name = var.cluster_configurations.cluster_name
  tags = merge(var.tags, var.cluster_configurations.cluster_tags)
}

resource "aws_ecs_cluster_capacity_providers" "my_cluster" {
  cluster_name = aws_ecs_cluster.my_cluster.name

  capacity_providers = ["${var.cluster_configurations.capacity_provider}"]

  default_capacity_provider_strategy {
    base              = 0
    weight            = 1
    capacity_provider = var.cluster_configurations.capacity_provider
  }
}




