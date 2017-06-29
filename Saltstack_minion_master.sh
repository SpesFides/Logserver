#!/bin/bash

#inport SaltStack R-Key
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

#Set Http link to site
deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main

#Instal minion
sudo apt-get -y install salt-minion


#Restart Salt minion
sudo systemctl restart salt-minion

#Set interface config
sudo -i
echo 127.0.0.1 salt > /etc/hosts
exit


#Running SALT
sudo salt-minion

#Setting Fingerprint key
output=$(echo |grep "master.pub: " fingerprint.txt)
SUBSTRING=$(echo $output | cut -d ' ' -f 2)

sed -i "/master_finger:/ c\ master_finger:'$SUBSTRING'" /etc/salt/minion

#Accepted keys
salt-key -y -A

