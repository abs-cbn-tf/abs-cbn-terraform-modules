variable "aws_region" {
  description = "aws region"
  default     = "ap-southeast-1"
}

variable "vpc_id" {
  description = "ID of the VPC"
  default     = "vpc-5a35d53e"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = ["subnet-5999ae2e", "subnet-c21d549b"]
}

variable "ami_id" {
  description = "ID of the AMI"
  default     = "ami-04a0ae173da5807d3"
}

variable "instance_type" {
  description = "Instance type for the autoscaling group"
  default     = "t2.micro"
}

variable "min_size" {
  description = "Minimum number of instances in the autoscaling group"
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the autoscaling group"
  default     = 3
}

variable "desired_capacity" {
  description = "Desired number of instances in the autoscaling group"
  default     = 2
}

variable "scale_out_cpu_threshold" {
  description = "CPU threshold for scaling out"
  default     = 70
}

variable "scale_in_cpu_threshold" {
  description = "CPU threshold for scaling in"
  default     = 30
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1c", "us-east-1d"]
}

