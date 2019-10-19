#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install tomcat
sudo yum update -y
sudo yum install -y java-1.8.0-openjdk-devel
sudo wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.zip
sudo unzip apache-tomcat-9.0.27.zip
sudo mv apache-tomcat-9.0.27 /usr/local/tomcat/
sudo chmod 777 /usr/local/tomcat/
#sudo cp tomcat-users.xml /usr/local/tomcat/conf/
#sudo sh /usr/local/tomcat/bin/startup.sh
sudo cp /tmp/webapp.war /usr/local/tomcat/webapps









