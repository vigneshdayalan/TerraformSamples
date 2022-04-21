terraform {
  backend "s3" {
    bucket                  = "testbucket-viki"
    key                     = "backend_statefile.tf"
    region                  = "ap-south-1"
    shared_credentials_file = "C:/Users/Vignesh.babu/.aws/credentials"
    profile                 = "405545616352_generic-dev-access-terra"
  }
}
