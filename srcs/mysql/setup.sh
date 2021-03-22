# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/19 05:20:28 by rgilles           #+#    #+#              #
#    Updated: 2021/03/19 05:20:31 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

mkdir -p /run/mysqld
#sed -i 's/^.*auth_pam_tool_dir.*$/#auth_pam_tool_dir not exists/' /usr/bin/mysql_install_db

if [ -d /var/lib/mysql/mysql ]; then
	echo "[i] MySQL directory already present, skipping DB creation."
else
	echo "[i] MySQL data directory is not found, creating initial DB(s)..."
	mysql_install_db --defaults-file=/etc/mysql/my.cnf --user=root --datadir=/var/lib/mysql > /dev/null

	cat <<EOF >"tmp_file"
FLUSH PRIVILEGES;
CREATE USER 'root'@'%' IDENTIFIED BY "$DB_ROOTPASSWORD";
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
CREATE DATABASE $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --console --user=root --bootstrap < tmp_file
	rm -f tmp_file
fi

#telegraf &
exec /usr/bin/mysqld --defaults-file=/etc/mysql/my.cnf --user=root --console
