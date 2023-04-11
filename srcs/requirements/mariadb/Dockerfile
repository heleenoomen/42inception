FROM alpine:3.16

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY conf/mariadb.sh .

RUN chmod +x mariadb.sh && sh mariadb.sh && rm mariadb.sh

ENTRYPOINT ["mysqld", "--user=root"]
