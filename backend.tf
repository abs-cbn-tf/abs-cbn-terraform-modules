terraform {
  backend "s3" {
    bucket                  = "abs-cbn-terraform-state"
    key                     = "terraform.tfstate"
    region                  = "ap-southeast-1" # Set your desired AWS region
    encrypt                 = true
    dynamodb_table          = "terraform-lock"
    shared_credentials_file = "~/.aws/credentials"
    profile = "naren"
  }
}

