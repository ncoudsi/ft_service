#!/bin/sh

#Build and run the Nginx container.
sudo docker build ./srcs/nginx -t nginx > logs/nginx_logs.log
sudo docker run -dt nginx

#Build and run the Wordpress container.
sudo docker build ./srcs/wordpress -t wordpress > logs/wordpress_logs.log
sudo docker run -dt wordpress

#Build and run the phpMyAdmin container.
sudo docker build ./srcs/phpmyadmin -t phpmyadmin > logs/phpmyadmin_logs.log
sudo docker run -dt phpmyadmin

#Build and run the MySQL container.
sudo docker build ./srcs/mysql -t mysql > logs/mysql_logs.log
sudo docker run -dt mysql