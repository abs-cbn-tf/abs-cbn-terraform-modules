terraform {
  backend "s3" {
    bucket = "news-abs-cbn-terraform-state-uat-internal/news-uat-internal/"
    key    = "terraform.tfstate"
    region = "ap-southeast-1" # Set your desired AWS region
    # encrypt        = true
    dynamodb_table = "terraform-IMP"
    profile        = "default"
  }
}
