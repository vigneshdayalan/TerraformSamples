# provider "aws" {
#   region     = "ap-south-1"
#   shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
#   profile                 = "405545616352_generic-dev-access-terra"
# }

resource "aws_instance" "ec2Try" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
}
