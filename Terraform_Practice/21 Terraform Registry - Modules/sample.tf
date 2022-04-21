module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = 1

  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"

  subnet_id = "subnet-8aaf46e1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
