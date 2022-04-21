terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.42.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}

variable ami {
  default = {
      "ap-south-1" = "ami-010aff33ed5991201"
      "eu-west-2" = "ami-06dc09bb8854cbde3"
  }
}

variable region {
  default = "eu-west-2"
}

variable tag {
  default = ["1st instance","2nd instance","3rd instance"]
}

resource "aws_instance" "ec2Try" {
  ami           = lookup(var.ami,var.region,"us-east-1")
  instance_type = "t2.micro"
  count = 3
  tags = {
    name = element(var.tag,count.index)
    }
}
