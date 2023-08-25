#!/bin/bash
#copy original file to backup file
cp /etc/apache2/sites-enabled/000-default.conf  /etc/apache2/sites-enabled/000-default.conf.bak

#print conf content
cat /etc/apache2/sites-enabled/000-default.conf

#replace from Require all deny to Require all granted
sudo sed -i 's/Require all denied/Require all granted/' /etc/apache2/sites-enabled/000-default.conf

#restart apache2 service
systemctl restart apache2


#add fix to exercise3 here
The problem was inside the conf file /etc/apache2/sites-enabled/000-default.conf

The option "Require all" was configured for denied.
As I changed to "Require all granted" I succeed to browse to the website.
