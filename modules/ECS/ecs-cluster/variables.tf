variable "tf_my_cluster" {
  description = "name for cluster"
  type        = string
}

variable "tf_capacity_provider" {
  description = "Type of provider (fagate or fargate spot)"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

