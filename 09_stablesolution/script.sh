#!/bin/bash
sudo su
amazon-linux-extras install nginx1 -y
mv /home/ec2-user/travel /usr/share/nginx/html
sed -i s+/usr/share/nginx/html+/usr/share/nginx/html/travel+g /etc/nginx/nginx.conf
systemctl enable nginx
service nginx start