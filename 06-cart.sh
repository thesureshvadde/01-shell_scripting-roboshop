dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip
cd /app 
unzip /tmp/cart.zip
npm install 
vim /etc/systemd/system/cart.service
systemctl daemon-reload
systemctl enable cart
systemctl start cart