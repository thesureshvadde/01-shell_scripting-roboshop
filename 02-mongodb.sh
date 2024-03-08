vim /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y 
systemctl enable mongod
systemctl start mongod
vim /etc/mongod.conf -- 127.0.0.1 to 0.0.0.0 
systemctl restart mongod