terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.85.0"
    }
  }
  backend "s3" {
    bucket         = "remotestates3-02"
    key            = "expense-vpc"
    region         = "us-east-1"
    dynamodb_table = "networking-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}
