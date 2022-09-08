
//Cách 1: dễ nhất khai báo trực tiếp module ứng với từng biến
module "keypairA" {
  source = "./modules/keypair"
  keyname = var.keys.keyA
}

module "keypairB" {
  source = "./modules/keypair"
  keyname = var.keys.keyB
}

resource "aws_instance" "appA" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  key_name      = var.keys.keyA 
  security_groups = ["ping_ssh"]
  tags = {
    Name = "App A"
  }
}

resource "aws_instance" "appB" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  key_name      = var.keys.keyB
  security_groups = ["ping_ssh"]
  tags = {
    Name = "App B"
  }
}

output "ssh_command" {
  value = "ssh -i '${var.keys.keyA}.pem' ec2-user@${aws_instance.appA.public_ip}"
}

output "appA_pkey" {
  value = module.keypairA.public_key
}
