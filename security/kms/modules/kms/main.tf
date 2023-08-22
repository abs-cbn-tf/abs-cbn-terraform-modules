resource "aws_kms_key" "kms" {
  count               = length(var.kms_keys)
  description         = var.kms_keys[count.index].description
  deletion_window_in_days = var.kms_keys[count.index].deletion_window

  tags = {
    Name = var.kms_keys[count.index].name
    Env        = var.env
    Project     = var.project
  }
}

output "kms_key_arns" {
  value = aws_kms_key.kms[*].arn
}

