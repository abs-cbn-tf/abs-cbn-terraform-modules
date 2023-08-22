resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.private_app_subnet_az1.id

  tags = {
    Name = "NAT Gateway"
  }
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}
