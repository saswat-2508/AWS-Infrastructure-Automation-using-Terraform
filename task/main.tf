provider "aws" {
  region = "ap-south-2"
}
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"

  }
}

resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-vpc.id
}

resource "aws_security_group" "my-sg" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "private"
  }
}

resource "aws_instance" "my-instance" {
  ami           = "ami-02774d409be696d81"
  key_name      = "AP-south-2"
  instance_type = "t3.nano"
  subnet_id = aws_subnet.private-subnet.id
  security_groups = [ aws_security_group.my-sg.id ]

}

