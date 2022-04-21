terraform {
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


resource "aws_instance" "web" {
  ami                    = data.aws_ami.example.id
  instance_type          = "t2.micro"
  key_name               = "terraform-try"
  vpc_security_group_ids = ["${aws_security_group.webSG.id}"]

  tags = {
    Name = "viki_ec2"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]


    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform-try.pem")
      host        = self.public_ip
    }
  }

}

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["*amzn2-ami-hvm*"]
  }
}

resource "aws_security_group" "webSG" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}
