module "service_role_1" {
  source             = "./modules/service_role"
  role_name          = var.service_role_1_name
  assume_role_policy = var.service_role_1_assume_role_policy
  tags               = var.service_role_1_tags
}

module "service_role_2" {
  source             = "./modules/service_role"
  role_name          = var.service_role_2_name
  assume_role_policy = var.service_role_2_assume_role_policy
  tags               = var.service_role_2_tags
}

