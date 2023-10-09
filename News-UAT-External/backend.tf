terraform {
  backend "s3" {
    bucket = "abs-cbn-terraform-state-test"
    key    = "terraform.tfstate"
    region = "ap-southeast-1" # Set your desired AWS region
    # encrypt        = true
    # dynamodb_table = "terraform-test"
    profile = "default"
  }
}
