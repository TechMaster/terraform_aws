module "ssh_key_pair" {
  source = "cloudposse/key-pair/aws"
  version               = "0.18.3"
  stage                 = var.stage
  name                  = var.keyname
  ssh_public_key_path   = "."
  generate_ssh_key      = "true"
  private_key_extension = ".pem"
  public_key_extension  = ".pub"
}

resource "aws_instance" "appA" {
  ami             = "ami-0ff89c4ce7de192ea"
  instance_type   = "t2.micro"
  key_name        = "${var.stage}-${var.keyname}"
  security_groups = ["ping_ssh"]
  tags = {
    Name = "App A"
  }
}

output "ssh_command" {
  value = "ssh -i '${var.stage}-${var.keyname}.pem' ec2-user@${aws_instance.appA.public_ip}"
}

