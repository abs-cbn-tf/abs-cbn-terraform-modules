resource "aws_ebs_volume" "ebs_volume" {
  count             = var.volume_count
  availability_zone = var.availability_zone
  size              = var.volume_size
  tags              = var.tags
}

