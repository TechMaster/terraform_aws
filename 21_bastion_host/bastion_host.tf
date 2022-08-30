module "bastion_keypair" {
  source  = "./modules/keypair"
  keyname = var.bastionkey
}

resource "aws_instance" "bastion_host" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  key_name      = var.bastionkey

  depends_on = [ //Cần chờ private key pair tạo xong để upload vào bastion host
    module.private_keypair
  ]

  //Associate with public subnet
  subnet_id                   = aws_subnet.public-subnet[0].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.ssh_ping.id]

  tags = {
    Name = "BastionHost"
  }

  //Upload private keypair vào /home/ec2-user/ của bastion host
  provisioner "file" {
    source      = "./${var.privatekey}.pem"
    destination = "/home/ec2-user/${var.privatekey}.pem"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.bastionkey}.pem")
      host        = aws_instance.bastion_host.public_ip
    }
  }
}

//In ra câu lệnh SSH vào Bastion Host
output "ssh_bastion_host" {
  value = "ssh -i '${var.bastionkey}.pem' ec2-user@${aws_instance.bastion_host.public_ip}"
}
