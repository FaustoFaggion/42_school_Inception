DOCKER_COMPOSE    =    ./srcs/docker-compose.yml

DATA_PATH        =    /home/fagiusep

DB_VOLUME        =    $(DATA_PATH)/data/db/
WP_VOLUME        =    $(DATA_PATH)/data/wp/

all:
	@ sudo mkdir -p $(DB_VOLUME)
	@ sudo mkdir -p $(WP_VOLUME)
	@ docker-compose -f $(DOCKER_COMPOSE) up --build -d
	@ sudo sed -i "s/127.0.0.1	localhost/127.0.0.1	fagiusep.42.fr/" /etc/hosts

clean:
	@ docker-compose -f $(DOCKER_COMPOSE) down --volumes

fclean: clean
	@ sudo rm -rf $(DATA_PATH)

re: fclean all

stop:
	@ docker stop nginx mariadb wordpress

clean_up: 
	@ bash ./srcs/requirements/tools/clean.sh