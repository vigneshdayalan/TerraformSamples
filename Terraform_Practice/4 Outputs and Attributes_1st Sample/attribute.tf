terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.41.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}

resource "aws_s3_bucket" "locals3" {
  bucket = "my-tf-emis-test-bucket"
}

resource "aws_eip" "localip" {
}

output "s3_id" {
  value = aws_s3_bucket.locals3.id
}
