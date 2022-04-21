provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}

variable "ports" {
  default = []
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  tags = {
    Name = "allow_tls"
  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = portrange
    content {
      description = "TLS from VPC"
      from_port   = portrange.value
      to_port     = portrange.value
      protocol    = "tcp"
    }
  }

  dynamic "egress" {
    for_each = var.ports
    content {
      description = "TLS from VPC"
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
    }
  }
}
