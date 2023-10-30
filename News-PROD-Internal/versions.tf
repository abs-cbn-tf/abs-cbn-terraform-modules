# Terraform Block
terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = var.profile
}
/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/

terraform {
  backend "s3" {
    bucket         = "news-abs-cbn-terraform-state-prod-internal"
    key            = "news-prod-internal/terraform.tfstate"
    region         = "ap-southeast-1" # Set your desired AWS region
    encrypt        = true
    dynamodb_table = "terraform-IMP"
    profile        = "News-PROD-Internal"
  }
}
