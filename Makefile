# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Makefile -
# 42 Inception project - LEMP stack, containerized.
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

NAME				= inception

SRC_DIR				= ./srcs
COMPOSE_FILE		= $(SRC_DIR)/docker-compose.yml

VOLUME_DIR			= /home/hoomen/data
WP_CONTENT_VOLUME	= $(VOLUME_DIR)/wordpress
WP_DB_VOLUME		= $(VOLUME_DIR)/mariadb

COMPOSE				= docker compose --file $(COMPOSE_FILE)

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# MAIN BUILD:

all: $(NAME)

$(NAME): $(COMPOSE_FILE) create_volumes
	$(COMPOSE) up -d --build

# -p option: no error if existing and make parent dirs as needed
create_volumes:
	mkdir -p $(WP_CONTENT_VOLUME) $(WP_DB_VOLUME)

down:
	$(COMPOSE) down

fclean: down
	docker system prune -a --force --volumes
	docker network prune --force
	docker volume prune --force

clear_local_volumes:
	@echo -n "Deleting all existing data (ctrl-C to stop process) in "; \
	sleep 1; echo -n "3 "; sleep 1; echo -n "2 "; sleep 1; echo -n "1 "; \
	sleep 1; echo "Deleting all data"; sleep 1
	sudo rm -drf ~/data   

ffclean: fclean clear_local_volumes

# rebuild all images, but save local volumes
re: fclean all

# rebuild everything, delete all data
scratch: ffclean all

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# DEBUGGING methods

# view logs
logs:
	$(COMPOSE) logs

# open terminal inside containers
exec_nginx:
	docker exec -it nginx sh

exec_mdb:
	docker exec -it mariadb sh

exec_wp:
	docker exec -it wordpress sh

# remove single containers
rm_nginx:
	$(COMPOSE) stop nginx
	$(COMPOSE) rm nginx

rm_mdb:
	$(COMPOSE) stop mariadb
	$(COMPOSE) rm mariadb

rm_wp:
	$(COMPOSE) stop wordpress
	$(COMPOSE) rm wordpress

# remove unused and dangling images
prune_all:
	docker system prune -a

# redo containers
re_nginx: rm_nginx prune_all all
re_mdb: rm_mdb prune_all all
re_wp: rm_wp prune_all all

# show containers
ps:
	docker ps -a

# show images
im:
	docker image ls -a

