terraform {
  backend "s3" {
    bucket = "bucket-for-tf-project-static-web-gsingh"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}