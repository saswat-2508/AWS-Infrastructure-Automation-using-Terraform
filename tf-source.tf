provider "aws" {
  region = "ap-south-1"
  
}

data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
}

output "aws_ami" {
    value = data.aws_ami.name.id
  
}
resource "aws_instance" "server" {
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t3.micro"
    key_name = "myserver"
  
}

data "aws_caller_identity" "name" {
  
}
output "call_info" {
  value = data.aws_caller_identity.name
  
}
data "aws_availability_zones" "name" {
  
}
output "aws_zones" {
  value = data.aws_availability_zones.name
}

data "aws_region" "name" {
  
}
output "region_name" {
  value = data.aws_region.name
}

data "aws_security_group" "name" {
  id = "sg-01e9e4af16db924f8"
}
output "security_group" {
  value = data.aws_security_group.name.id
}