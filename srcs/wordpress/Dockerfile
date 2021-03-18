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

RUN		apk add --no-cache php7 php7-fpm php7-opcache php7-gd\
		php7-mysqli php7-zlib php7-curl	php7-mcrypt php7-soap php7-openssl\
		php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-sqlite3\
		php7-apcu php7-pdo_pgsql php7-bcmath php7-odbc php7-pdo_mysql\
		php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2\
		php7-iconv php7-pdo_dblib php7-ctype nginx openrc openssl
#RUN 	apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN		mkdir -p /var/www/
RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar xvzf latest.tar.gz
RUN		mv ./wordpress /var/www/
RUN		rm -rf latest.tar.gz

RUN 	openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=IDF/O=42/CN=localhost" \
		-addext "subjectAltName=DNS:localhost" -newkey rsa:4096\
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt
RUN 	mkdir -p /run/nginx
COPY	nginx.conf /etc/nginx/conf.d/default.conf
#COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE	5050
CMD php-fpm7 && nginx -g 'daemon off;'