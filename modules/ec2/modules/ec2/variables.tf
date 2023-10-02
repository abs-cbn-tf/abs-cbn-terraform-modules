variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type of the EC2 instance"
  type        = string
}


variable "key_name" {
  description = "Instance type of the EC2 instance"
  type        = string
}

variable "tags" {
  description = "Additional tags to assign to the EC2 instances"
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "ID of the VPC where the EC2 instances will be created"
  type        = string
}

