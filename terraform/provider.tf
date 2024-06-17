terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "nagarjuna9.remote-state1"
    key    = "expense-vpc"
    region = "us-east-1"
    dynamodb_table = "nagarjuna9-locking1"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}