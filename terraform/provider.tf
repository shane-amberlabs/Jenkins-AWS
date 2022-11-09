terraform {
  backend "s3" {
    bucket         = "aws-refresh-tfstate-s3"
    key            = "terraform.tfstate"
    dynamodb_table = "aws-refresh-tfstate-dynamodb"
    encrypt        = true
    region         = "us-west-2"
  }
}
