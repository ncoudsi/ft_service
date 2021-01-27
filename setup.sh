#!/bin/sh

#Add $USER to the docker group.
sudo usermod -aG docker $USER
#Delete previous cluster (if any).
minikube delete
#Stop all running containers.
docker stop $(docker ps -a -q)
#Delete all containers.
docker rm $(docker ps -a -q)
#Start Minikube (--driver option specifies in which VM we want to start the cluster).
minikube start --driver=docker

#Build and run the Nginx container.
# sudo docker build ./srcs/nginx -t nginx > logs/nginx_build_logs.log
# sudo docker run -dt nginx

# #Build and run the Wordpress container.
# sudo docker build ./srcs/wordpress -t wordpress > logs/wordpress_build_logs.log
# sudo docker run -dt wordpress

# #Build and run the phpMyAdmin container.
# sudo docker build ./srcs/phpmyadmin -t phpmyadmin > logs/phpmyadmin_build_logs.log
# sudo docker run -dt phpmyadmin

# #Build and run the MySQL container.
# sudo docker build ./srcs/mysql -t mysql > logs/mysql_build_logs.log
# sudo docker run -dt mysql