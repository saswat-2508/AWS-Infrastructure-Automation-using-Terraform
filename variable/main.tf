provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "var-instance" {
  ami           = "ami-051a31ab2f4d498f5"
  instance_type = var.aws_instance_type

  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = var.root_volume_size
  }
}
