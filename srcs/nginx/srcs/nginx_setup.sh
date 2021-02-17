#!/bin/sh

#Copy configuration in Nginx's directory.
cp nginx.conf /etc/nginx/

#Create nginx directory needed to boot nginx.
mkdir /run/nginx/

#Make a SSL certification.
chmod +x mkcert
./mkcert -install
./mkcert localhost

#Start Nginx without halting (-g option sets global directives out of .conf file).
# nginx -g "daemon off;"

nginx

tail -f /dev/null