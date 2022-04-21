terraform {
  required_version = "> 0.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}

provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}


resource "aws_instance" "ec2Try" {
  ami           = data.aws_ami.example.id
  instance_type = "t2.micro"
}

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm"]
  }
}
