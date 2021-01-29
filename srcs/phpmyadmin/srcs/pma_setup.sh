#!/bin/sh

#Copy configuration in Nginx's directory.
mv nginx.conf /etc/nginx/

#Copy pma configuration in phpmyadmin directory.
mv config.inc.php /phpmyadmin

#Boot php-fpm.
/usr/sbin/php-fpm7

#Create nginx directory needed to boot nginx.
mkdir /run/nginx/

#Start Nginx without halting (-g option sets global directives out of .conf file).
nginx -g "daemon off;"
