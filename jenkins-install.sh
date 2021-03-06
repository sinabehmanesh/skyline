#!/bin/bash

#this is a shell script for intslling jenkins on ubuntu - worked on ubuntu 19.04

#check user privilages

echo "starting installation of jenkins..."
echo "checking user privilages..."

if [ $(id -u) -eq 0 ]
then
	echo "Congratulations, you have root permission"
else
	echo "sorry. Run as ROOT!"
	exit 1
fi

echo "Adding repository ..."

#repository add
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

#source.list add
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


#check if key is added successfully

if [ $? -eq 0 ]; then
	echo "The key added successfully..."
else
	echo "key problem!"
	exit 1
fi

#updating
echo "updating repository...."

sudo apt update 

#installing java
echo "installing java8 ..."

sudo apt install openjdk-8-jdk -y

if [ $? -eq 0 ]; then
        echo "Java8 installed successfully..."
else
        echo "Java Problem!"
        exit 1
fi

java -version

#installing jenkins
echo "installing jenkins...."
sudo apt-get install jenkins -y

if [ $? -eq 0 ]; then
    echo "finishing installation...."
else
    echo "Faild while installing jenkins"
fi


#ufw port checking! (on ubuntu 19.04)
sudo ufw allow 8080

#initial password
echo "installation compelete"
echo "initial admin password is:"

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

#source: digital ocean
#wirtten by sina behmanesh 2019 :D
#Edited by Dante 2019 ;)
