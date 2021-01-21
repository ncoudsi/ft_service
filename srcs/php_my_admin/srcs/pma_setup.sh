#!/bin/sh

#Copy configuration in Nginx's directory.
cp nginx.conf /etc/nginx/

#Boot php-fpm.
/usr/sbin/php-fpm7

#Create nginx directory needed to boot nginx.
mkdir /run/nginx/

#Starts and configure mysql.
# mysql start
# echo "CREATE DATABASE wordpress;" | mysql -u root
# echo "CREATE USER 'wordpress'@'localhost';" | mysql -u root
# echo "SET password FOR 'wordpress'@'localhost' = password('password');" | mysql -u root
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root
# mysql wordpress -u root < /var/www/localhost/wordpress/wordpress.sql

#Start Nginx without halting (-g option sets global directives out of .conf file).
nginx -g "daemon off;"
