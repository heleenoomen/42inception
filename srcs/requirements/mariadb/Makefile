build:
	docker build -t mdb .

run:
	docker run -d --name mdb mdb

runi:
	docker run -it --name mdb mdb

stop:
	docker stop $$(docker ps -aq)

rm:
	docker rm $$(docker ps -aq)

rmi:
	docker image rm $$(docker image ls -a)

clean: stop rm rmi

fclean: clean
	docker system prune -a --force

exec:
	docker exec -it mdb sh
