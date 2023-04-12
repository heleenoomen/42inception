all: build
	bash srcs/requirements/wordpress/tools/make_dir.sh
	cd srcs && docker compose up

build:
	bash srcs/requirements/wordpress/tools/make_dir.sh
	cd srcs && docker compose up --build

down:
	cd srcs && docker compose down

fclean: down
	docker system prune -a --force --volumes
	docker network prune --force
	docker volume prune --force

clear_local_volumes:
	sudo rm -drf ~/data   

ffclean: fclean clear_local_volumes
