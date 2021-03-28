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

RUN		apk add --no-cache vsftpd screen openssl
RUN		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY	./telegraf.conf /etc/telegraf/telegraf.conf

RUN 	openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=IDF/O=42/CN=localhost" \
		-addext "subjectAltName=DNS:localhost" -newkey rsa:4096\
		-newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem\
		-out /etc/ssl/private/vsftpd.pem

COPY	./vsftpd.conf /etc/vsftpd
RUN		yes 'root' | passwd

RUN		echo "hello" > /root/hello.txt
RUN		echo $'#!/bin/sh\nvsftpd /etc/vsftpd/vsftpd.conf' > /tmp/setup.sh && chmod +x /tmp/setup.sh

EXPOSE	20
EXPOSE	21
EXPOSE	8975
CMD		screen -d -m telegraf && /tmp/setup.sh