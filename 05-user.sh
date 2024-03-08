dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip
cd /app 
unzip /tmp/user.zip
npm install 
vim /etc/systemd/system/user.service
systemctl daemon-reload
systemctl enable user
systemctl start user
vim /etc/yum.repos.d/mongo.repo
dnf install mongodb-org-shell -y
mongo --host mongodb.sureshvadde.online < /app/schema/user.js