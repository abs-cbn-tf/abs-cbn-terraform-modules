resource "aws_security_group" "security_group" {
  name        = var.sg_configurations.sg_name
  description = var.sg_configurations.sg_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_configurations.ingress_rules #var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      self        = ingress.value.self
    }
  }

  dynamic "egress" {
    for_each = var.sg_configurations.egress_rules #var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      self        = egress.value.self
    }
  }

  tags = merge(var.tags, var.sg_configurations.sg_tags)
}

