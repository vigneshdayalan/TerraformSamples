provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}

resource "aws_iam_user" "myIAM" {
  name  = "emisuser${count.index}"
  count = 3
}

output "arn" {
  value = aws_iam_user.myIAM[*].arn
}

output "name" {
  value = aws_iam_user.myIAM[*].name
}

output "Results" {
  value = zipmap(aws_iam_user.myIAM[*].name,aws_iam_user.myIAM[*].arn)
}
