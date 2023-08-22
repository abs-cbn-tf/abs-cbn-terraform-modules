module "ebs_volumes" {
  source            = "./modules/ebs_volumes"
  volume_count      = var.volume_count
  availability_zone = var.availability_zone
  volume_size       = var.volume_size
  tags              = var.tags
}

module "ebs_volume_2" {
  source              = "./modules/ebs_volumes"
  availability_zone   = "us-east-1a"
  volume_count = var.volume_count
  volume_size         = 10
  tags = {
    Name        = "EBS Volume 2"
    Environment = "Production"
  }
}

