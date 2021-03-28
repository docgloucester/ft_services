# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 12:21:47 by rgilles           #+#    #+#              #
#    Updated: 2021/03/07 12:21:49 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

minikube start
eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f srcs/metallb-config.yaml

kubectl apply -f srcs/persistent_volume.yaml

docker build -t influxdb srcs/influxdb
kubectl apply -f srcs/influxdb/secret.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml

docker build -t mysql srcs/mysql
kubectl apply -f srcs/mysql/secret.yaml
kubectl apply -f srcs/mysql/mysql.yaml

docker build -t wordpress srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

docker build -t phpmyadmin srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t nginx srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

docker build -t ftps srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

docker build -t grafana srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml

screen -d -m minikube dashboard