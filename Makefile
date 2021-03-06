help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

open: ## Open elixir container interactive pseudo tty
	@echo "Makefile: Opening elixir container interactive pseudo tty..."
	@docker exec -it elixir_server /bin/bash

setup: ## Set up, for the first time use, elixir and postgres containers
	@echo "Makefile: Creating and starting containers..."
	@mkdir -p elixir_apps/
	@chmod g+s elixir_apps/
	@docker-compose --file docker-compose.yaml up -d

	@echo "Makefile: Listing containers..."
	@docker ps

setup-recreate: ## Delete, recreate and start elixir and postgres containers
	@echo "Makefile: Recreate and starting containers..."
	@mkdir -p elixir_apps/
	@chmod g+s elixir_apps/
	@$(MAKE) shutdown
	@docker rmi -f elixir_elixir_server elixir_postgres_server
	@docker-compose --file docker-compose.yaml up -d --build --force-recreate

	@echo "Makefile: Listing containers..."
	@docker ps

shutdown: ## Shut down elixir and postgres containers
	@echo "Makefile: Stopping and removing containers..."
	@docker-compose --file docker-compose.yaml down --v

	@echo Makefile: Listing containers...
	@docker ps

start: ## Start elixir and postgres containers (considering setup was done)
	@echo "Makefile: Starting containers..."
	@docker-compose --file docker-compose.yaml up -d
