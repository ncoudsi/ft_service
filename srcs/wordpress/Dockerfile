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

RUN			apk add --no-cache openrc

#Download and extract wordpress.
RUN			wget https://www.wordpress.org/latest.tar.gz \
			&& tar -xf latest.tar.gz \
			&& rm -rf latest.tar.gz

#Copy all files from srcs (in the computer) in /root (in the container).
COPY		srcs /root

#Define the directory you will be in when the container boots.
WORKDIR		/root/

#Expose port.
EXPOSE		5050

#Run wordpress_setup.sh when the container boots.
ENTRYPOINT	["sh", "wordpress_setup.sh"]