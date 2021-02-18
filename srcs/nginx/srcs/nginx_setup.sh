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

#Keep the container running. Since a countainer should
#stop as soon as its activities are done, tail -f will keep
#it buisy.
tail -f /dev/null