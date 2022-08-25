#!/bin/bash
sudo su
yum update -y
amazon-linux-extras install nginx1 -y

# Install PHP 8.0
amazon-linux-extras enable php8.0
yum clean metadata
yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y
systemctl enable php-fpm
service php-fpm start


systemctl enable nginx
# Move web site configure file to /etc/nginx/conf.d/
cp /home/ec2-user/phpsite.conf /etc/nginx/conf.d/

# Move phpsite to /var/www/ to advoid forbidden error 403
mv /home/ec2-user/phpsite /var/www/

# Start Nginx
service nginx start

# Install Certbot
amazon-linux-extras install epel -y
yum -y install certbot python-certbot-nginx
certbot --nginx --non-interactive --agree-tos -m cuong@techmaster.vn -d awshardway.click -d www.awshardway.click
service nginx restart

# Auto renew Certbot
echo << EOF > /etc/cron.d/certbot
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

0 * * * 7 /usr/local/bin/certbot renew && systemctl restart nginx
EOF
systemctl restart crond
