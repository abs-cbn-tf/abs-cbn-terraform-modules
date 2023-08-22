# create private app subnet az1
resource "aws_subnet" "private_app_subnet_az1" {
  vpc_id                   =  aws_vpc.vpc.id
  cidr_block               =  var.private_app_subnet_az1_cidr
  availability_zone        =  data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  =  false

#  tags      = {
#    Name    =  var.private_app_subnet_az1
#  }
#}
  tags = var.private1_subtags
}

# create private app subnet az2
resource "aws_subnet" "private_app_subnet_az2" {
  vpc_id                   =  aws_vpc.vpc.id
  cidr_block               =  var.private_app_subnet_az2_cidr 
  availability_zone        =  data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  =  false

#  tags      = {
#    Name    =  var.private_app_subnet_az2
#  }
  tags = var.private2_subtags
}

# create private data subnet az1
resource "aws_subnet" "private_data_subnet_az1" {
  vpc_id                   =  aws_vpc.vpc.id
  cidr_block               =  var.private_data_subnet_az1_cidr
  availability_zone        =  data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  =  false

#  tags      = {
#    Name    = var.private_data_subnet_az1
#  }
  tags = var.privatedata1_subtags
}

# create private data subnet az2
resource "aws_subnet" "private_data_subnet_az2" {
  vpc_id                   =  aws_vpc.vpc.id
  cidr_block               =  var.private_data_subnet_az2_cidr
  availability_zone        =  data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  =  false

#  tags      = {
#    Name    = var.private_data_subnet_az2
#  }
 tags = var.privatedata2_subtags
}



