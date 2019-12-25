terraform {
  backend "s3" {
    bucket = "container-era-terraform"
    key = "ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
