#variable "role_name" {
#  description = "Name of the service role"
#  type        = string
#}

#variable "assume_role_policy" {
#  description = "Assume role policy document"
#  type        = string
#}

#variable "tags" {
#  description = "Tags for the service role"
#  type        = map(string)
#}

#variable "service-role-1" {}
#variable "service-role-2" {}

variable "role_name" {
  description = "Name of the service role"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy for the service role"
  type        = string
}

variable "tags" {
  description = "Tags for the service role"
  type        = map(string)
}

variable "service_role_1_name" {
  type        = string
  description = "Name of Service Role 1"
}

variable "service_role_1_assume_role_policy" {
  type        = string
  description = "Assume Role Policy for Service Role 1"
}

variable "service_role_1_tags" {
  type        = map
  description = "Tags for Service Role 1"
}

variable "service_role_2_name" {
  type        = string
  description = "Name of Service Role 2"
}

variable "service_role_2_assume_role_policy" {
  type        = string
  description = "Assume Role Policy for Service Role 2"
}

variable "service_role_2_tags" {
  type        = map
  description = "Tags for Service Role 2"
}

