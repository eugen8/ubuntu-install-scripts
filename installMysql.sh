#!/bin/bash

#installing mysql-server and client
#https://support.rackspace.com/how-to/installing-mysql-server-on-ubuntu/
# mysql-secure-installation at:   https://dev.mysql.com/doc/refman/5.7/en/mysql-secure-installation.html
 
echo "Installing mysqlserver and client"
#sudo apt-get install mysql-server -y

echo "Updating firewall rules";
#sudo ufw allow mysql

sudo grep '^### tuple' /etc/ufw/user*.rules

echo "Start and Enable mysql at startup"
systemctl start mysql

echo "mysql should be enabled, if not run: systemctl enable mysql"
systemctl list-unit-files --type=service | grep mysql


#sudo systemctl stop mysql.service
#sudo systemctl start mysql.service

#https://dev.mysql.com/doc/refman/8.0/en/resetting-permissions.html
#echo "Resetting root password to 'root'"
#sudo mysqld --init-file=./mysql-init.sql &
#https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost  - this is a really amazing explanation why we can't connect with mysql -u root -p on Ubuntu 
#Other useful commands
#ps -aux | grep mysql
#kill -s 9 PROCESSIDHERE
#


# EXECUTE some scripts
#https://stackoverflow.com/questions/6150675/how-to-feed-mysql-queries-from-bash
#https://stackoverflow.com/questions/8940230/how-can-i-run-an-sql-script-in-mysql

echo "Create new user and database"







