#!/bin/bash

service php7.3-fpm start
service php7.3-fpm status
service mysql start
#creating database
mysql -e "CREATE DATABASE server_db;"
mysql -e "GRANT ALL ON server_db.* \
TO 'user_db'@'localhost' \
IDENTIFIED BY 'pass_db' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
nginx -g 'daemon off;'
