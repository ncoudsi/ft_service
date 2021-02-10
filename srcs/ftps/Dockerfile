#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install gcc compiler for pure-ftpd configuration
RUN			apk add build-base

#Install OpenSSL lib for TLS purpose.
RUN			apk add openssl openssl-dev

#Install wget
RUN			apk add wget

#Download, extract and rename pure-ftpd
RUN			wget https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.49.tar.gz; \
			tar zxvf pure-ftpd-1.0.49.tar.gz; \
			rm pure-ftpd-1.0.49.tar.gz; \
			mv pure-ftpd-1.0.49 /root/pure-ftpd

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose ports.
EXPOSE		21 1024

#Run ftps_setup.sh when the container boots.
ENTRYPOINT	["sh", "ftps_setup.sh"]