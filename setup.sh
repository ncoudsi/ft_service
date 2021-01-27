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

# Set the environment variable to use local Docker (allows you to re-use the Docker daemon inside the Minikube instance).
eval $(minikube docker-env)

#Build and run the Nginx container.
sudo docker build ./srcs/nginx -t nginx_img > logs/nginx_build_logs.log
sudo docker run -dt nginx_img
#Build and run the Wordpress container.
sudo docker build ./srcs/wordpress -t wordpress_img > logs/wordpress_build_logs.log
sudo docker run -dt wordpress_img
#Build and run the phpMyAdmin container.
sudo docker build ./srcs/phpmyadmin -t phpmyadmin_img > logs/phpmyadmin_build_logs.log
sudo docker run -dt phpmyadmin_img
#Build and run the MySQL container.
sudo docker build ./srcs/mysql -t mysql_img > logs/mysql_build_logs.log
sudo docker run -dt mysql_img

kubectl apply -f srcs/nginx/srcs/nginx_deployment.yaml
kubectl apply -f srcs/wordpress/srcs/wordpress_deployment.yaml
kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin_deployment.yaml
kubectl apply -f srcs/mysql/srcs/mysql_deployment.yaml


#Start minikube Dashboard.
minikube dashboard