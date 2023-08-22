region                       = "us-east-2"
project_name                 = "abs"
vpc_cidr                     = "10.0.0.0/16"
public_subnet_az1_cidr       = "10.0.0.0/24"
public_subnet_az1_abs        = "public_subnet_az1_abs"
public_subnet_az2_cidr       = "10.0.1.0/24"
public_subnet_az2_abs        = "public_subnet_az2_abs"
private_app_subnet_az1_cidr  = "10.0.2.0/24"
private_app_subnet_az1_abs   = "private_app_subnet_az1_abs"
private_app_subnet_az2_cidr  = "10.0.3.0/24"
private_app_subnet_az2_abs   = "private_app_subnet_az2_abs"
private_data_subnet_az1_cidr = "10.0.4.0/24"
private_data_subnet_az1_abs  = "private_data_subnet_az1_abs"
private_data_subnet_az2_cidr = "10.0.5.0/24"
private_data_subnet_az2_abs  = "private_data_subnet_az2_abs"
#cidr_out_sg="0.0.0.0"
egress_cidr_blocks = "0.0.0.0"
vpc_tags = {
  Name = "vpc1"
  Env  = "dev"
  project = "vpcproject"
  foo = "bar"
}
private1_subtags = {
  Name = "private_app_subnet_az1_abs"
  Env  = "dev"
}


private2_subtags = {
  Name = "private_app_subnet_az2_abs"
  Env  = "dev"
}


privatedata1_subtags = {
  Name = "private_data_subnet_az1_abs"
  Env  = "dev"
}


privatedata2_subtags = {
  Name = "private_data_subnet_az2_abs"
  Env  = "dev"
}

project_name2                    = "dev"
vpc_cidr1                        = "10.1.0.0/16"
public_subnet_az1_cidr_dev       = "10.1.2.0/24"
public_subnet_az1_dev            = "public_subnet_az1_dev"
public_subnet_az2_cidr_dev       = "10.1.3.0/24"
public_subnet_az2_dev            = "public_subnet_az2_dev"
private_app_subnet_az1_cidr_dev  = "10.1.4.0/24"
private_app_subnet_az1_dev       = "private_app_subnet_az1_dev"
private_app_subnet_az2_cidr_dev  = "10.1.5.0/24"
private_app_subnet_az2_dev       = "private_app_subnet_az2_dev"
private_data_subnet_az1_cidr_dev = "10.1.6.0/24"
private_data_subnet_az1_dev      = "private_data_subnet_az1_dev"
private_data_subnet_az2_cidr_dev = "10.1.7.0/24"
private_data_subnet_az2_dev      = "private_data_subnet_az2_dev"
#cidr_out_sg="0.0.0.0"
#egress_cidr_blocks="0.0.0.0"

vpc_tags2 = {
  Name = "vpc2"
  Env  = "qa"
  project = "vpc2project"
  foo = "bar1"
}

#private2_subtags = {
# Name = "private_app_subnet_az1_dev"
# Env = "qa"
#}
