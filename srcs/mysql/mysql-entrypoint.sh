#!/bin/sh

./etc/init.d/mariadb setup
./etc/init.d/mariadb start
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'user_db'@'%' IDENTIFIED BY 'pass_db';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'user_db'@'%' IDENTIFIED BY 'pass_db';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "USE wordpress;"
mysql -u root wordpress < wordpress.sql
./etc/init.d/mariadb stop
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
