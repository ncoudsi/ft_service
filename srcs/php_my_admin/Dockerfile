#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install Nginx.
RUN			apk add nginx

#Install wget.
RUN			apk add wget

#Install php packages.
RUN			apk add php \
			php-cli \
			php-cgi \
			php-mbstring \
			php-fpm \
			php-mysqli

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Get, extract and rename pma.
RUN			wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN			tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN			rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN			mv phpMyAdmin-5.0.2-all-languages phpmyadmin

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose port.
EXPOSE		5000

#Run pma_setup.sh when the container boots.
ENTRYPOINT	["sh", "pma_setup.sh"]