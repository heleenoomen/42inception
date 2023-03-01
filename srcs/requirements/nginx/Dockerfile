FROM alpine:3.17
RUN apk update && apk upgrade && apk add --no-cache nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
# TODO add rule to create key continuously (each time you start Docker, you generate new)