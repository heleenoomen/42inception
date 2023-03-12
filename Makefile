images=$$(docker image ls -aq)

all:
	cd srcs && docker compose up -d --build

clean:
	cd srcs && docker compose down

fclean: clean 
	docker image rm $(images)

