#Define Alpine Linux as the container's OS
FROM		alpine:latest

#Update server.
RUN			apk update

#Install Nginx.
RUN			apk add nginx

#Install wget.
RUN			apk add wget

#Install php packages (most of them may not be mandatory, but ended up to put them all due to multiple errors).
RUN			apk add php7 \
			php7-cli \
			php7-cgi \
			php7-mbstring \
			php7-fpm \
			php7-mysqli \
			php7-common \
			php7-iconv \
			php7-json \
			php7-opcache \
			php7-zlib \
			php7-session \
			php7-gd \
			php7-curl \
			php7-xml \
			php7-imap \
			fcgi \
			php7-pdo \
			php7-pdo_mysql \
			php7-soap \
			php7-xmlrpc \
			php7-posix \
			php7-mcrypt \
			php7-gettext\
			php7-ldap \
			php7-ctype \
			php7-dom

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Get, extract and rename pma.
RUN			wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz; \
			tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz; \
			rm phpMyAdmin-5.0.2-all-languages.tar.gz; \
			mv phpMyAdmin-5.0.2-all-languages phpmyadmin

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose port.
EXPOSE		5000

#Run pma_setup.sh when the container boots.
ENTRYPOINT	["sh", "pma_setup.sh"]