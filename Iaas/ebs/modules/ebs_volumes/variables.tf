variable "volume_count" {
  type        = number
  description = "Number of EBS volumes to create"
}

variable "availability_zone" {
  type        = string
  description = "Availability zone for the EBS volumes"
}

variable "volume_size" {
  type        = number
  description = "Size of each EBS volume in GB"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the EBS volumes"
}

