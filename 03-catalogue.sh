dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip
cd /app 
unzip /tmp/catalogue.zip
npm install 
vim /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue
vim /etc/yum.repos.d/mongo.repo
dnf install mongodb-org-shell -y
mongo --host mongodb.sureshvadde.online < /app/schema/catalogue.js