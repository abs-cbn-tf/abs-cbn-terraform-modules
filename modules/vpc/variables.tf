variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "public_subnet_az1_cidr" {}
variable "public_subnet_az2_cidr" {}
variable "private_app_subnet_az1_cidr" {}
variable "private_app_subnet_az2_cidr" {}
variable "private_data_subnet_az1_cidr" {}
variable "private_data_subnet_az2_cidr" {}
variable "egress_cidr_blocks" {
  type    = list(string)
  default = []
}

variable "private_app_subnet_az1" {}
variable "private_app_subnet_az2" {}
variable "private_data_subnet_az1" {}
variable "private_data_subnet_az2" {}


variable "public_subnet_az1" {}
variable "public_subnet_az2" {}
# variable "vpc_tags" {}
variable "tags" {
  type = map(string)
}

#from the root vpc 
# variable "public_subnet_az1_abs" {}
# variable "public_subnet_az2_abs" {}
# variable "private_app_subnet_az1_abs" {}
# variable "private_app_subnet_az2_abs" {}
# variable "private_data_subnet_az1_abs" {}
# variable "private_data_subnet_az2_abs" {}
