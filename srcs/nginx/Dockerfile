# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/15 15:23:02 by rgilles           #+#    #+#              #
#    Updated: 2021/03/15 15:23:04 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk add --no-cache nginx openssl screen
RUN		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY	./telegraf.conf /etc/telegraf/telegraf.conf

RUN 	mkdir -p /run/nginx
COPY	nginx.conf /etc/nginx/conf.d/default.conf

RUN 	openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=IDF/O=42/CN=localhost" \
		-addext "subjectAltName=DNS:localhost" -newkey rsa:4096\
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt

RUN		echo "hello world!!" > /var/www/index.html

EXPOSE	80
EXPOSE	443
CMD screen -d -m telegraf && nginx -g 'daemon off;'