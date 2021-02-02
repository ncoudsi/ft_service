#!/bin/sh

#Copy configuration in Nginx's directory.
cp nginx.conf /etc/nginx/

#Boot php-fpm.
/usr/sbin/php-fpm7

#Create nginx directory needed to boot nginx.
mkdir /run/nginx/

#Move wp-config.php in wordpress directory.
mv wp-config.php /wordpress

#Start Nginx without halting (-g option sets global directives out of .conf file).
nginx -g "daemon off;"