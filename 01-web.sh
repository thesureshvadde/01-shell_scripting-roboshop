#!/bin/bash
source common.sh
code_dir=$(pwd)

print_head "installing nginx"
dnf install nginx -y
status_check

print_head "enabling nginx"
systemctl enable nginx
status_check

print_head "starting nginx"
systemctl start nginx
status_check 

print_head "removing nginx default content"
rm -rf /usr/share/nginx/html/*
status_check

print_head "downloading web content"
curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip
status_check

print_head "changing directory to /usr/share/nginx/html"
cd /usr/share/nginx/html
status_check

print_head "unzip web.zip"
unzip /tmp/web.zip
status_check

print_head "copy roboshop.conf"
cp ${code_dir}/configuration/roboshop.conf /etc/nginx/default.d/roboshop.conf 
status_check

print_head "restarting Nginx"
systemctl restart nginx
status_check