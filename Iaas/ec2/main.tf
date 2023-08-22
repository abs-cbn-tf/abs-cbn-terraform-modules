provider "aws" {
  region = "us-east-1"
}

module "ec2_instance1" {
  source = "./modules/ec2"

  instance_name = "instance1"
  ami_id        = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  key_name = "myamazon"
  subnet_id = "subnet-0ace4f1921a299913"
  tags = {
    Name        = "instance1"
    Environment = "Production"
    project = "ec2project"
  }
}

module "ec2_instance2" {
  source = "./modules/ec2"

  instance_name = "instance2"
  ami_id        = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  subnet_id = "subnet-0ace4f1921a299913"
  key_name = "myamazon"
  tags = {
    Name        = "instance2"
    Environment = "dev"
    project = "ec2project"
  }
}

