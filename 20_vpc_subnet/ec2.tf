resource "aws_instance" "web" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.generated_key.key_name

  //Associate with public subnet
  subnet_id                   = aws_subnet.public-subnet[0].id
  associate_public_ip_address = true
  //security_groups = ["web_ssh_ping"]
  vpc_security_group_ids = [aws_security_group.web_ssh_ping.id]

  user_data = <<-EOF
              #!/bin/bash
              echo 'Hello World' > index.html
              sudo python3 -m http.server 80 &
              EOF
  tags = {
    Name = "HelloWorld"
  }
}
locals {
  instance_ip = aws_instance.web.public_ip
}
output "ssh_command" {
  value = "ssh -i '${var.keyname}.pem' ec2-user@${local.instance_ip}"
}
