name = Inception
dir = $(PWD)/srcs

all:
	@echo "Start configuration '${name}'... "
	@echo "$(dir)"
	@cd $(dir) && docker-compose up -d

build:
	@echo "Build configuration '${name}'... "
	@cd $(dir) && docker-compose up -d --build

stop:
	@echo "Stop configuration '${name}..."
	@cd $(dir) && docker-compose down

re:
	@echo "Build configuration '${name}'... "
	@cd $(dir) && docker-compose up -d --build

clean: stop
	@echo "Clean configuration '${name}...'"
	@docker system prune -a

fclean:
	@echo "Total cleanup of all docker configurations..."
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

.PHONY: all build stop re clean fclean
