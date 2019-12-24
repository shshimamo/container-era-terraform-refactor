resource "aws_instance" "sandbox" {
  ami = "ami-785c491f"
  instance_type = "t2.micro"
  # remote_stateを指定している
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_id
}

provider "aws" {
  region = "ap-northeast-1"
}

# dataセクションでremote_stateを設定しvpcという名前で参照できるようにしている
# このremote_stateを参照するには
# "data.terraform_remote_state.名前.outputで指定した名前"で参照する
# 今回はvpcのtfstateのoutputにpublic_subnet_idがあるため
# data.terraform_remote_state.vpc.outputs.public_subnet_id
# で参照できる
data "terraform_remote_state" "vpc" {
  # tfstateの参照先を指定する。S3に保存している場合はs3
  backend = "s3"

  # 参照するための設定
  config = {
    bucket = "container-era-terraform"
    key = "test/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

terraform {
  backend "s3" {
    bucket = "container-era-terraform"
    # keyはvpcのものと重複しないようにする
    key = "test/ec2/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
