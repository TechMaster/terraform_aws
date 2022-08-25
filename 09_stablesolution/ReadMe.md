Giải pháp sử dụng user_data để chạy lệnh ổn định hơn cách sử dụng `provisioner "remote-exec"`

```hcl
resource "null_resource" "remote" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./${var.keyname}.pem")
    host        = aws_instance.web.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install nginx1 -y",   //Cài đặt nginx
      "sudo mv /home/ec2-user/travel /usr/share/nginx/html", //Chuyển thư mục /home/ec2-user/travel vào /usr/share/nginx/html
      "sudo sed -i s+/usr/share/nginx/html+/usr/share/nginx/html/travel+g /etc/nginx/nginx.conf", //thay thế đường dẫn root trong nginx.conf
      "sudo service nginx start" //khởi động service nginx
    ]
  }
}
```

Ngoài ra bài này còn sử dụng Elastic IP
```hcl
resource "aws_eip" "elastic_ip" {
  instance = aws_instance.web.id
  vpc      = true
}
```
cho phép EC2 reboot nhưng public IP vẫn giữ nguyên