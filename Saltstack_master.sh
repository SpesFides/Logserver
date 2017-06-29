#!/bin/bash

#inport SaltStack R-Key
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

#Set Http link to site
deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main

#Install Salt master
sudo apt-get -y install salt-master

#Restart Salt master
sudo systemctl restart salt-master


#CONFIGURE SALT MASTER

#Interface edit
sed -i 's/0.0.0.0/10.7.0.26/g' /etc/salt/master

#RUNNING SALT
sudo salt-master

#MASTERKEY FINGERPRINT
#Set key to fingerprint file
sudo salt-key -F master > fingerprint.txt

