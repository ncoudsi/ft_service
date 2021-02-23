#!/bin/sh

#Creating directories for the conf file, and activating TLS.
mkdir /etc/pure-ftpd
mkdir /etc/pure-ftpd/conf
echo "2" > /etc/pure-ftpd/conf/TLS

#Create, if not exist the directory where pure-ftpd will look for ssl certificate.
mkdir -p /etc/ssl/private

#Create the key and certificate for TSL sessions.
openssl req -x509 -nodes \
-subj '/C=FR/ST=PARIS/L=PARIS/O=42/CN=localhost' \
-days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/pure-ftpd.pem \
-out /etc/ssl/private/pure-ftpd.pem 

openssl dhparam -out /etc/ssl/private/pure-ftpd-dhparams.pem 2048

chmod 600 /etc/ssl/private/*.pem

#Create admin user and set its password.
adduser -D "admin"
echo "admin:admin" | chpasswd

#Run pure-ftpd in background. For some reasons, if it runs in
#foreground, telegraf stops getting metrics from ftps-container.
#-p : use only this port range for passive mode.
#-P : force the specified IP.
#-j : create home directory if needed.
pure-ftpd -j -Y 2 -p 1024:1024 -P 172.17.0.2 &

#Keep the container running since pure-ftpd is in background.
tail -f /dev/null