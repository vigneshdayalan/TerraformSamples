//In this example we are creating ec2 instance and elastic ip.
//And linking elastic ip to security group and ecc 2 instance

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

//creating ec2 instance
resource "aws_instance" "web" {
  ami           = "ami-06dc09bb8854cbde3"
  instance_type = "t2.micro"
}

//creating ealstic ip
resource "aws_eip" "lb" {
}


//adding elastic ip to ec2 instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.lb.id
}

//creating security group and adding elastic ip in that
resource "aws_security_group" "local_sg" {
  name        = "terra_sg"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"]
  }
}
