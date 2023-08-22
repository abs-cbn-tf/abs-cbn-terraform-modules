# create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags                 = var.vpc_tags
  #  tags      = {
  #    Name    = "${var.project_name}-vpc"
  #  }
}

resource "aws_security_group" "vpc_sg" {
  name        = "vpc-security-group"
  description = "vpc security group"

  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    #    cidr_blocks = ["var.vpc_cidr"]
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_cidr_blocks
  }
}
# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}



# create route table and add public route
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "consumption-rtb-public"
  }
}

# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public_route_table.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_az2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public_route_table.id
}










############

resource "aws_route_table_association" "private_app_subnet_az1_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_app_subnet_az1.id
}

resource "aws_route_table" "private_app_subnet_az1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "consumption-rtb-private1-ap-southeast-1a"
  }
}

resource "aws_route" "private_app_subnet_az1_nat_gateway_route" {
  route_table_id         = aws_route_table.private_app_subnet_az1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
#############

resource "aws_route_table_association" "private_app_subnet_az2_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_app_subnet_az2.id
}

resource "aws_route_table" "private_app_subnet_az2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "consumption-rtb-private2-ap-southeast-1b"
  }
}

resource "aws_route" "private_app_subnet_az2_nat_gateway_route" {
  route_table_id         = aws_route_table.private_app_subnet_az2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

###############



resource "aws_route_table_association" "private_data_subnet_az1_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_data_subnet_az1.id
}

resource "aws_route_table" "private_data_subnet_az1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "consumption-rtb-private3-ap-southeast-1a"
  }
}

resource "aws_route" "private_data_subnet_az1_nat_gateway_route" {
  route_table_id         = aws_route_table.private_data_subnet_az1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}



###############



resource "aws_route_table_association" "private_data_subnet_az2_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_data_subnet_az2.id
}

resource "aws_route_table" "private_data_subnet_az2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "consumption-rtb-private4-ap-southeast-1b"
  }
}

resource "aws_route" "private_data_subnet_az2_nat_gateway_route" {
  route_table_id         = aws_route_table.private_data_subnet_az2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
