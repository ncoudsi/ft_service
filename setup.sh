#!/bin/sh

#Variables for colored output in the terminal.
GREEN="\e[1;32m"
WHITE="\e[0m"

#Add $USER to the docker group (if not existing). Allow you to use docker commands without sudo.
#WARNING : if sudo is used in a docker build command, the image cant be pulled by k8s later on,
#due to rights on the image. It will result with a "Image can't be pulled" error and deployments won't work.
if [ $(grep "docker" /etc/group | grep -c "$USER") -eq 0 ]
then
	sudo usermod -aG docker $USER
	echo ${GREEN}"==Need to reboot session to apply new user to docker group.=="${WHITE}
	echo ${GREEN}"==Need admin password to do so.=="${WHITE}
	sudo shutdown -r now
fi
#Start Minikube (--driver option specifies in which VM we want to start the cluster).
#Condition is here to avoid starting minikube if it is already running.
if [ $(minikube status > logs/minikube_status.log ; grep -c "Running" logs/minikube_status.log) -ne 3 ]
then
	echo ${GREEN}"\t==Starting minikube.=="${WHITE}
	minikube start --driver=docker
	##Install MetalLB (see https://metallb.universe.tf/installation) It wont be deleted afterwards so you can apply it just once here.
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	kubectl apply -f srcs/metallb/metallb_configmap.yaml
fi

#Clean evrything that remains from previous usages.
echo ${GREEN}"\n\t==Deleting existing K8s cluster.=="${WHITE}
echo ${GREEN}"Services :"${WHITE}
kubectl delete services --all
echo ${GREEN}"Pods :"${WHITE}
kubectl delete pods --all
echo ${GREEN}"Deployments :"${WHITE}
kubectl delete deployments --all
echo ${GREEN}"Persistent Volume Claims :"${WHITE}
kubectl delete pvc --all


# Set the environment variable to use local Docker (allows you to re-use the Docker daemon inside the Minikube instance).
eval $(minikube docker-env)

#Build the Nginx container.
docker build ./srcs/nginx -t nginx > logs/nginx_build_logs.log
#Build the Wordpress container.
docker build ./srcs/wordpress -t wordpress > logs/wordpress_build_logs.log
#Build the PhpMyAdmin container.
docker build ./srcs/phpmyadmin -t phpmyadmin > logs/phpmyadmin_build_logs.log
#Build the MySQL container.
docker build ./srcs/mysql -t mysql > logs/mysql_build_logs.log
#Build the FTPS server container.
docker build ./srcs/ftps -t ftps > logs/ftps_build_logs.log
#Build the Grafana server container.
docker build ./srcs/grafana -t grafana > logs/grafana_build_logs.log
#Build the influxdb server container.
docker build ./srcs/influxdb -t influxdb > logs/influxdb_build_logs.log

#Create a new cluster.
echo ${GREEN}"\n\t==Creating new K8s cluster.=="${WHITE}
echo ${GREEN}"Nginx :"${WHITE}
kubectl apply -f srcs/nginx/nginx_deployment.yaml
echo ${GREEN}"Wordpress :"${WHITE}
kubectl apply -f srcs/wordpress/wordpress_deployment.yaml
echo ${GREEN}"PhpMyAdmin :"${WHITE}
kubectl apply -f srcs/phpmyadmin/phpmyadmin_deployment.yaml
echo ${GREEN}"MySQL :"${WHITE}
kubectl apply -f srcs/mysql/mysql_deployment.yaml
echo ${GREEN}"FTPS server :"${WHITE}
kubectl apply -f srcs/ftps/ftps_deployment.yaml
echo ${GREEN}"Grafana server :"${WHITE}
kubectl apply -f srcs/grafana/grafana_deployment.yaml
echo ${GREEN}"influxdb server :"${WHITE}
kubectl apply -f srcs/influxdb/influxdb_deployment.yaml

#Start minikube Dashboard.
echo ${GREEN}"\n\t==Starting Dashboard.=="${WHITE}
minikube dashboard