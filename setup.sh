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

docker build -t wordpress srcs/wordpress
kubectl apply -f srcs/wordpress/secret.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml



# #install metallb
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# minikube addons enable metallb
# kubectl apply -f srcs/metallb-config.yaml

	