provider "aws" {
  region  = var.region
  profile = "default"
}

module "vpc" {
  source                       = "./modules"
  region                       = var.region
  project_name                 = var.project_name
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az1            = var.public_subnet_az1_abs
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  public_subnet_az2            = var.public_subnet_az2_abs
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az1       = var.private_app_subnet_az1_abs
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_app_subnet_az2       = var.private_app_subnet_az2_abs
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az1      = var.private_data_subnet_az1_abs
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
  private_data_subnet_az2      = var.private_data_subnet_az2_abs
  vpc_tags                     = var.vpc_tags
  private1_subtags             = var.private1_subtags
  private2_subtags             = var.private2_subtags
  privatedata1_subtags         = var.privatedata1_subtags
  privatedata2_subtags         = var.privatedata2_subtags
}




module "vpc2" {
  source                       = "./modules"
  region                       = var.region
  project_name                 = var.project_name2
  vpc_cidr                     = var.vpc_cidr1
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr_dev
  public_subnet_az1            = var.public_subnet_az1_dev
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr_dev
  public_subnet_az2            = var.public_subnet_az2_dev
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr_dev
  private_app_subnet_az1       = var.private_app_subnet_az1_dev
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr_dev
  private_app_subnet_az2       = var.private_app_subnet_az2_dev
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr_dev
  private_data_subnet_az1      = var.private_data_subnet_az1_dev
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr_dev
  private_data_subnet_az2      = var.private_data_subnet_az2_dev
  vpc_tags                     = var.vpc_tags2
  private1_subtags             = var.private1_subtags
  private2_subtags             = var.private2_subtags
  privatedata1_subtags         = var.privatedata1_subtags
  privatedata2_subtags         = var.privatedata2_subtags
}














