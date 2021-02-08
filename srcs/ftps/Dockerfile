#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Get, extract and rename pure-ftpd
RUN			apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose ports.
EXPOSE		21 1024

#Run ftps_setup.sh when the container boots.
ENTRYPOINT	["sh", "ftps_setup.sh"]