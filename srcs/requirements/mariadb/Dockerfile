FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
	chmod 777 /var/run/mysqld; \
	sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf

#RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mysql_install_db --user=root --datadir=/var/lib/mysql


CMD ["mysqld_safe", "--user=root"]
#CMD ["mysqld", "--user=root"]
#CMD ["sh"]
