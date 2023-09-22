NAME = inception

all:
	sh srcs/requirements/tools/mkdir.sh
	docker compose -p $(NAME) -f srcs/docker-compose.yml up -d

clean:
	docker compose -p $(NAME) -f srcs/docker-compose.yml down

fclean: clean
		sudo rm -rf /home/$(USER)/data
		docker compose -p $(NAME) -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
		docker builder prune -a -f

re: fclean all

.PHONY: all clean fclean re
