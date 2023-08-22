provider "aws" {
  region  = "us-west-2"
  profile = "default"
}

module "security_group" {
  source      = "./modules/security_group"
  vpc_id      = "vpc-f02b4695"
  name        = "my-security-group"
  description = "My security group"
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  ]
  security_group_tags = {
    env     = var.env
    project = var.project
    foo     = var.foo
    # Add more tags as needed
  }
}


/* module "security_group_2" {
  source        = "./modules/security_group"
  vpc_id        = "vpc-f02b4695"
  name          = "security-group-2"
  description   = "Security Group 2"
  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  ]
} */



module "security_group_2" {
  source      = "./modules/security_group"
  vpc_id      = "vpc-f02b4695"
  name        = "push-web-ecs-service-sg"
  description = "push-web-ecs-service-sg"
  ingress_rules = [
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["10.0.0.0/16"]
    }
  ]
}


module "security_group_3" {
  source      = "./modules/security_group"
  vpc_id      = "vpc-f02b4695"
  name        = "push-web-sg"
  description = "push-web-sg"
  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

