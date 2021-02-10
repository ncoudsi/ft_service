#!/bin/sh

#Create admin user and set its password.
adduser -D "admin"
echo "admin:admin" | chpasswd

# mkdir -p /etc/ssl/private

openssl dhparam -out /etc/ssl/private/pure-ftpd-dhparams.pem 2048

openssl req -x509 -nodes -newkey rsa:2048 -sha256 \
  -keyout /etc/ssl/private/ftps.pem \
  -out /etc/ssl/private/ftps.pem \
  -subj '/C=FR/ST=PARIS/L=PARIS/O=42/CN=localhost'

chmod 777 /etc/ssl/private/*.pem

#Configure and install pure-ftpd to be TLS compatible.
cd pure-ftpd
./configure --with-tls ...
make install-strip

#Run pure-ftpd
#-p : use only this port range for passive mode.
#-P : force the specified IP.
pure-ftpd -p 1024:1024 -P 172.17.0.2