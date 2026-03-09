resource "aws_instance" "trial-instance" {
    ami = "ami-02774d409be696d81"
    key_name = "AP-south-2"
    instance_type = "t3.nano"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [ aws_security_group.ngnix-sg.id]
    associate_public_ip_address = true
     



    user_data = <<-EOF
            #!/bin/bash
            sudo yum install ngnix -y
            sudo systenctl start ngnix
            EOF
    tags = { 
      Name = "NginxServer"
    }
}