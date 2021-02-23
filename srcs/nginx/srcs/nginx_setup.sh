#!/bin/sh

#Copy configuration in Nginx's directory.
cp nginx.conf /etc/nginx/

#Create nginx directory needed to boot nginx.
mkdir /run/nginx/

#Make a SSL certification.
chmod +x mkcert
./mkcert -install
./mkcert localhost

#Start Nginx.
nginx

#Check if nginx is still running, if not, end the script to
#restart the container.
IS_RUNNING=0
while [ $IS_RUNNING -eq 0 ]
do
    ps aux | grep -v "grep" | grep "nginx" | grep -v "nginx_setup.sh"
    if [ $? -ne 0 ]
    then
        IS_RUNNING=1
    fi
    sleep 5
done