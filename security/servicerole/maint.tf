# Configure AWS provider
provider "aws" {
  region = "us-east-1"  # Replace with your desired region
  profile = "default"
}

# Define the module
module "ec2_instance" {
  source = "./ec2-instance-module"

  region             = "us-east-1"  # Replace with your desired region
  role_name          = "my-ec2-role"
  role_assume_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  policy_arn         = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"  # Replace with the desired policy ARN
  ami                = "ami-0889a44b331db0194"  # Replace with your desired AMI
  instance_type      = "t2.micro"
  key_name           = "myamazon"  # Replace with your key pair

  instance_tags = {
    Name = "example-instance"
    env = var.env
    project = var.project
    foo = var.foo
  }
}

