FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --datadir=/var/lib/mysql

EXPOSE 3306

COPY conf/create_db.sh .

RUN chmod +x create_db.sh

RUN sh create_db.sh && rm create_db.sh

CMD ["mysqld_safe", "--user=root"]
