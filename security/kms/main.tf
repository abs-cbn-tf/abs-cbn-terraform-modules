module "kms" {
  source = "./modules/kms"

  kms_keys = var.kms_keys
}


module "kms2" {
  source = "./modules/kms"

  kms_keys = var.kms_keys
   env       = var.env1
  project   = var.project1
}


module "kms3" {
  source = "./modules/kms"

  kms_keys = var.kms_keys
}



module "kms4" {
  source = "./modules/kms"

  kms_keys = var.kms_keys
}
