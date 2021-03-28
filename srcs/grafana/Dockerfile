# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/28 00:25:17 by rgilles           #+#    #+#              #
#    Updated: 2021/03/28 00:25:19 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk add --no-cache grafana grafana-openrc screen
RUN		apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY	./telegraf.conf /etc/telegraf/telegraf.conf

COPY	datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY	dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY	dashboard.json /usr/share/grafana/conf/provisioning/dashboards/

WORKDIR /usr/share/grafana

EXPOSE	3000
CMD 	screen -dmS telegraf_screen && screen -S telegraf_screen -X stuff 'telegraf\n' && grafana-server --config=/etc/grafana.ini
