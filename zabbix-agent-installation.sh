#zabbix agent installation on ubuntu 18.04
#sina behmanesh 2020
#zabbix 4.2

#/bin/bash

if [ $(id -u) -eq 0 ]
then
        echo "initialling installation....."
else
        echo "sorry. Run as ROOT!"
        exit 1
fi

#installation

wget https://repo.zabbix.com/zabbix/4.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_4.2-1+bionic_all.deb

sudo dpkg -i zabbix-release_4.2-1+bionic_all.deb

sudo apt update

sudo apt install zabbix-agent -y


sudo nano /etc/zabbix/zabbix_agentd.conf


#service

sudo systemctl restart zabbix-agent

sudo systemctl enable zabbix-agent
