#!/bin/sh

#Create admin user and set its password.
adduser -D "admin"
echo "admin:admin" | chpasswd

#Run pure-ftpd
pure-ftpd -p 1024:1024 -P 172.17.0.2