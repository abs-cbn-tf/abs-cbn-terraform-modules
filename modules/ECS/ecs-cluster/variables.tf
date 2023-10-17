variable "cluster_configurations" {
  type = object({
    cluster_name      = string
    capacity_provider = string
    cluster_tags      = map(string)
  })
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

