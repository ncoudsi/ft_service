#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install Nginx.
RUN			apk add nginx

#Install OpenSSL
RUN			apk add openssl

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose ports.
EXPOSE		80 443

#Run nginx_setup.sh when the container boots.
ENTRYPOINT	["sh", "nginx_setup.sh"]