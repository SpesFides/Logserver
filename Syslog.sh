#!/bin/bash

#Configure UDP
sudo sed -i 's/#module(load="imudp")/module(load="imudp")/g' /etc/rsyslog.conf
sudo sed -i 's/#input(type="imudp" port="514")/input(type="imudp" port="514")/g' /etc/rsyslog2.conf

#Set log to file
echo "$template TmplAuth,"/var/log/%HOSTNAME%/%PROGRAMNAME%.log"" >> rsyslog2.conf  ????

#Change permissions
cd /var && sudo chown syslog:syslog log

#Reboot server
sudo reboot