//Cách 2: dùng lệnh for_each
module "keypair" {
  source = "./modules/keypair"
  for_each = var.keys
  keyname = each.value
}


resource "aws_instance" "appA" {
  ami           = "ami-0ff89c4ce7de192ea"
  instance_type = "t2.micro"
  key_name      = var.keys.keyA // Tương tự module.keypair["keyA"].aws_key_pair.generated_key.key_name
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

