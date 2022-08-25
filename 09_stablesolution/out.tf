//Chuyển tất cả output variable vào đây

output "ssh_command" {
  value = "ssh -i '${var.keyname}.pem' ec2-user@${aws_eip.elastic_ip.public_ip}"
}

output "web_site" {
  value = "http://${aws_eip.elastic_ip.public_ip}"
}