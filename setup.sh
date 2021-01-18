#!/bin/sh

echo "user42" | sudo docker build ./srcs/nginx -t nginx
sudo docker run -dt nginx