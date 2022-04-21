provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
  profile                 = "405545616352_generic-dev-access-terra"
}

resource "aws_instance" "ec2Try" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
}

terraform {
  required_providers {
    github = {
      source = "integrations/github"

    }
  }
}

provider "github" {
  token = "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"
}

resource "github_repository" "viki_repo" {
  name        = "git-terraform-try"
  description = "My awesome codebase"

  visibility = "public"
}
