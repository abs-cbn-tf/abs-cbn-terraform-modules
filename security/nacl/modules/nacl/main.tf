resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id
  tags = var.nacl_tags
#  tags   = {
#    Name = var.name
#    env = var.env
#    project = var.project
#    foo = var.foo
#  }
}

resource "aws_network_acl_rule" "ingress_rule" {
  count            = length(var.ingress_rules)
  network_acl_id   = aws_network_acl.nacl.id
  rule_number      = count.index * 10 + 100
  rule_action      = "allow"
  egress           = false
  protocol         = "6"  # TCP
  from_port        = var.ingress_rules[count.index].from_port
  to_port          = var.ingress_rules[count.index].to_port
  cidr_block       = var.ingress_rules[count.index].cidr_block  # Use "cidr_block" instead of "cidr_blocks"
}

resource "aws_network_acl_rule" "egress_rule" {
  count            = length(var.egress_rules)
  network_acl_id   = aws_network_acl.nacl.id
  rule_number      = count.index * 10 + 200
  rule_action      = "allow"
  egress           = true
  protocol         = "6"  # TCP
  from_port        = var.egress_rules[count.index].from_port
  to_port          = var.egress_rules[count.index].to_port
  cidr_block       = var.egress_rules[count.index].cidr_block  # Use "cidr_block" instead of "cidr_blocks"
}

output "nacl_id" {
  value = aws_network_acl.nacl.id
}

