dnf install maven -y
useradd roboshop
mkdir /app
curl -o /tmp/shipping.zip https://roboshop-builds.s3.amazonaws.com/shipping.zip
cd /app 
unzip /tmp/shipping.zip
mvn clean package
mv target/shipping-1.0.jar shipping.jar
vim /etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
dnf install mysql -y
mysql -h mysql.sureshvadde.online -uroot -pRoboShop@1 < /app/schema/shipping.sql 
systemctl restart shipping