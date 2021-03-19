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

docker build -t wordpress srcs/wordpress
kubectl apply -f srcs/wordpress/secret.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
