provider "aws" {
    region = "ap-south-2"
  
}

# vpc creating
resource "aws_vpc" "traial-vpc" {
    cidr_block = "10.0.0.0/16"
}

# private subnet
resource "aws_subnet" "private" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.traial-vpc.id
}

#public subnet
resource "aws_subnet" "public" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.traial-vpc.id
  
}

#internet gateway
resource "aws_internet_gateway" "my_ig" {
    vpc_id = aws_vpc.traial-vpc.id
}

#routing table
resource "aws_route_table" "my_route" {
  vpc_id = aws_vpc.traial-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id

  }
}

resource "aws_route_table_association" "public_sub" {
  route_table_id = aws_route_table.my_route.id
  subnet_id      = aws_subnet.public.id
}

resource "aws_instance" "trial-instance" {
    ami = "ami-02774d409be696d81"
    key_name = "AP-south-2"
    instance_type = "t3.nano"
    subnet_id = aws_subnet.public.id
}