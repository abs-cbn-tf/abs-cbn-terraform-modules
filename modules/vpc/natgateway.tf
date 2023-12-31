resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = var.tags
}

resource "aws_eip" "nat_gateway" {
  domain = "vpc"
}
