output "instance_public_ip" {
  description = "The public ip address of the ec2"
  value = aws_instance.ngnixserver.public_ip
}

output "instance_url" {
    description = "The URL of the Ngnix server"
    value = "https://${aws_instance.trial-instance.public_ip}"
  
}