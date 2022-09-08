#!/bin/bash
sudo su
cd /home/ec2-user
wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm
rpm -Uvh jdk-17_linux-x64_bin.rpm
rm -f jdk-17_linux-x64_bin.rpm
mkdir photos
nohup java -jar demoupload-1.0.jar