#installation of zabbix server 4.2
#sina behmanesh 2020
#ubuntu 18.04


#!/bin/bash

if [ $(id -u) -eq 0 ]
then
	echo "initialling installation....."
else
	echo "sorry. Run as ROOT!"
	exit 1
fi

wget https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb
sudo dpkg -i zabbix-release_4.2-1+bionic_all.deb


sudo apt update

sudo apt install zabbix-server-mysql zabbix-frontend-php -y

sudo apt install zabbix-agent -y


mysql -u root -p  -e "create database zabbix character set utf8 collate utf8_bin;"

mysql -u root -p -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'zabbix_password';"

mysql -u root -p -e "flush privileges;"

echo "your zabbix-dabase password is : zabbix_password"
zcat /usr/share/doc/zabbix-server-mysql/create.sql.gz | mysql -uzabbix -p zabbix

sudo nano /etc/zabbix/zabbix_server.conf


sudo nano /etc/zabbix/apache.conf


#services

sudo systemctl restart apache2

sudo systemctl start zabbix-server

#sudo systemctl status zabbix-server

sudo systemctl enable zabbix-server
