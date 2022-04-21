provider "aws" {
  region     = "ap-south-1"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}

variable environment{
  default = "test"
}


// count = 1 means resource will be created once , so based on condition result, count variable will get 0 or 1
resource "aws_instance" "ec2Try_1" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  count = var.environment == "dev" ? 1:0
}

resource "aws_instance" "ec2Try_2" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.nano"
  count = var.environment == "test" ? 1:0
}
