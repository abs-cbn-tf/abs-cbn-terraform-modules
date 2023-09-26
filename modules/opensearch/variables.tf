variable "cluster_name" {
  description = "Name for the OpenSearch cluster."
}

variable "instance_type" {
  description = "Instance type for the OpenSearch cluster."
}

variable "access_policies" {
  description = "Access policies for the OpenSearch cluster."
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

