resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_id

  tags = var.tags
#    Name = var.instance_name
   
#  }
}

