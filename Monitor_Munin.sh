#!/bin/bash

#Install apache 2
sudo apt-get install -y apache2 apache2-utils

#Install dynazoom for extra information
sudo apt-get install -y libcgi-fast-perl libapache2-mod-fcgid

#Install munin master
sudo apt-get -y install munin

#Change gloval settings 		???
sudo sed -i '8s=#dbdir  /var/lib/munin=dbdir /var/lib/munin=g' /etc/munin/munin.conf 		

sudo sed -i 's/#htmldir /var/cache/munin/www/htmldir /var/www/munin/g' /etc/munin/munin.conf 

sudo sed -i 's/#logdir /var/log/munin/logdir /var/log/munin/g' /etc/munin/munin.conf

sudo sed -i 's/#rundir /var/run/munin/rundir  /var/run/munin/g' /etc/munin/munin.conf

sudo sed -i 's/#tmpldir /etc/munin/templates/tmpldir /etc/munin/templates/g' /etc/munin/munin.conf

#Make dir
mkdir -p /var/www/munin

#Make user and group
useradd -G munin munin

#change owner
cd /var/www/munin
chown munin:munin /var/www/munin/

#Set Master server
cd /etc/munin
sed -i 's/localhost.localdomain/MasterServerMunin/g' /etc/munin/munin.conf

#Edit apache file alias
sed -i 's@#Alias /munin-cgi/static /var/cache/munin/www/static@Alias /munin /var/www/munin@g' /etc/munin/apache.conf

#Edit directory
sed -i 's@<Directory /var/cache/munin/www>@<Directory /var/www/munin>@g' /etc/munin/apache.conf

# ?????????
sed -i 's@Order allow,deny@#Order allow,deny@g' /etc/munin/apache.conf						
sed -i 's@Allow from localhost 127.0.0.0/8 ::1@#Allow from localhost 127.0.0.0/8 ::1@g' /etc/munin/apache.conf
sed -i 's@Options None@#Options None@g' /etc/munin/apache2.conf

sed -e '#Options None/Require all granted'/etc/munin/apache2.conf  					
sed -e '#Require all granted/Options FollowSymLinks SymLinksIfOwnerMatch'/etc/munin/apache2.conf	

sed -e '# require valid-user/Require all granted'/etc/munin/apache2.conf				
sed -e '# Require all granted/Options FollowSymLinks SymLinksIfOwnerMatch'/etc/munin/apache2.conf	

