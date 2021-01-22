#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install mariadb (mysql fork).
RUN			apk add mariadb mariadb-client

#Create mysql directori in /run.
RUN			mkdir /run/mysql

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root/

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Run mysql_setup.sh when the container boots.
ENTRYPOINT	["sh", "mysql_setup.sh"]