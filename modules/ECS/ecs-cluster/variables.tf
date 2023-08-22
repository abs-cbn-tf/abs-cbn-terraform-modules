variable "tf_my_cluster" {
  description = "name for cluster"
  type        = string
}

variable "tf_capacity_provider" {
  description = "Type of provider (fagate or fargate spot)"
  type        = string
}
