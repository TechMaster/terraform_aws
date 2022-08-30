module "private_keypair" {
  source = "./modules/keypair"
  keyname = var.privatekey
}

resource "aws_instance" "private_instance" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  key_name      = var.privatekey

  //Associate with private subnet
  subnet_id              = module.vpc.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.private_ssh_ping.id]

  tags = {
    Name = "Private Instance"
  }
}

output "ssh_private_instance" {
  value = "ssh -i '${var.privatekey}.pem' ec2-user@${aws_instance.private_instance.private_ip}"
}
