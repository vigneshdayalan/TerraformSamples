variable "instance_type" {
  type = map(any)
  default = {
    "dev"     = "t2.nano"
    "test"    = "t3.nano"
    "prod"    = "t4.nano"
    "default" = "t2.micro"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-010aff33ed5991201"
  instance_type = lookup(var.instance_type, terraform.workspace)
}
