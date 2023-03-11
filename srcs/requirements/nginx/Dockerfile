FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes -days 356 -newkey rsa:2048 \
		-out /etc/ssl/certs/hoomen.42.fr.certs \
		-keyout /etc/ssl/private/hoomen.42.fr.key \
		-subj "/CN=hoomen.42.fr/"	

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

