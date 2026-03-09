terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.54.1"
      }
    }
    backend "s3" {
      bucket = "saswat-073"
      key = "backend.tfstate"
      region = "ap-south-2"
    }
}

provider "aws" {
  region = "ap-south-1"
  
}

resource "aws_instance" "server" {
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t3.micro"
    key_name = "myserver"
}