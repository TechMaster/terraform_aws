resource "aws_instance" "web" {
  ami             = "ami-0ff89c4ce7de192ea"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.generated_key.key_name
  security_groups = ["ingress_rules"]
  user_data = file("script.sh") 
  tags = {
    Name = "springapp"
  }

  //Copy file JAR vào thư mục /home/ec2-user/
  provisioner "file" {
    source      = "./demoupload-1.0.jar"
    destination = "/home/ec2-user/demoupload-1.0.jar"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./${var.keyname}.pem")
      host        = aws_instance.web.public_ip
    }
  }
}