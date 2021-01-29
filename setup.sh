#!/bin/sh

#Add $USER to the docker group (if not existing). Allow you to use docker commands without sudo.
#WARNING : if sudo is used in a docker build command, the image cant be pulled by k8s later on,
#due to rights on the image. It will result with a "Image can't be pulled" error and deployments won't work.
if [ $(grep "docker" /etc/group | grep -c "$USER") = 0 ]
then
	sudo usermod -aG docker $USER
fi
#Start Minikube (--driver option specifies in which VM we want to start the cluster).
if [ $(minikube status | grep -c "Running") != 3 ]
then
	minikube start --driver=docker
	##Install MetalLB (see https://metallb.universe.tf/installation) It wont be deleted afterwards so you can apply it just once here.
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	kubectl apply -f srcs/metallb/metallb_configmap.yaml
fi
#Clean evrything that remains from previous usages.
kubectl delete services --all
kubectl delete pods --all
kubectl delete deployments --all
kubectl delete pvc --all


# Set the environment variable to use local Docker (allows you to re-use the Docker daemon inside the Minikube instance).
eval $(minikube docker-env)

#Build and run the Nginx container.
docker build ./srcs/nginx -t nginx > logs/nginx_build_logs.log
#Build and run the Wordpress container.
docker build ./srcs/wordpress -t wordpress > logs/wordpress_build_logs.log
#Build and run the phpMyAdmin container.
docker build ./srcs/phpmyadmin -t phpmyadmin > logs/phpmyadmin_build_logs.log
#Build and run the MySQL container.
docker build ./srcs/mysql -t mysql > logs/mysql_build_logs.log

kubectl apply -f srcs/nginx/srcs/nginx_deployment.yaml
kubectl apply -f srcs/wordpress/srcs/wordpress_deployment.yaml
kubectl apply -f srcs/phpmyadmin/srcs/phpmyadmin_deployment.yaml
kubectl apply -f srcs/mysql/srcs/mysql_deployment.yaml

#Start minikube Dashboard.
minikube dashboard