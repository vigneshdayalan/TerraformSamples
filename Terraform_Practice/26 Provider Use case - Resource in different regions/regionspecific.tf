resource "aws_instance" "ec2Try" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
}

resource "aws_instance" "ec2Try1" {
  ami           = "ami-02f26adf094f51167"
  instance_type = "t2.micro"
  provider      = aws.myregion
}
