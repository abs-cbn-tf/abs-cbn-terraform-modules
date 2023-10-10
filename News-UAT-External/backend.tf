terraform {
  backend "s3" {
    bucket = "news-abs-cbn-terraform-state/news-uat-external/"
    key    = "terraform.tfstate"
    region = "ap-southeast-1" # Set your desired AWS region
    # encrypt        = true
    dynamodb_table = "terraform-IMP"
    profile        = "default"
  }
}
