dnf install golang -y
useradd roboshop
mkdir /app
curl -o /tmp/dispatch.zip https://roboshop-builds.s3.amazonaws.com/dispatch.zip
cd /app 
unzip /tmp/dispatch.zip
go mod init dispatch
go get 
go build
vim /etc/systemd/system/dispatch.service
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch