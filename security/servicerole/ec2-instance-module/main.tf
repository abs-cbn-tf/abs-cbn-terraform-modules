# Configure AWS provider
provider "aws" {
  region = var.region
  profile = "default"
}

# Create IAM role
resource "aws_iam_role" "ec2_role" {
  name = var.role_name

  assume_role_policy = var.role_assume_policy
}

# Create IAM instance profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2-instance-profile"  # Replace with a desired name for the instance profile

  role = aws_iam_role.ec2_role.name
}

# Attach IAM policy to the role
resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = var.policy_arn
}

# Create EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id = "subnet-0ace4f1921a299913"

  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  tags = var.instance_tags
}

