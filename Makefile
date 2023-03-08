name = simple_nginx_html

all:
	@printf "Launch 구성 ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d

build:
	@printf "Build 구성 ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping 구성 ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@printf "Rebuild 구성 ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@printf "Cleaning 구성 ${name}...\n"
	@docker system prune -a

fclean:
	@printf "Total clean of all 구성 Docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY	: all build down re clean fclean
