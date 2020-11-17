help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

down: ## Shut down Elixir and Postgres containers
	@echo "Makefile: Stopping and removing container..."
	@docker-compose --file docker/docker-compose.yaml down --v

	@echo Makefile: Listing containers...
	@docker ps

exec: ## Open Elixir container interactive pseudo tty
	@echo "Makefile: Opening container interactive pseudo tty..."
	@docker exec -it elixir_server /bin/bash

up: ## Start Elixir and Postgres containers up
	@echo "Makefile: Creating and starting container..."
	@docker-compose --file docker/docker-compose.yaml up -d --build --force-recreate

	@echo "Makefile: Listing containers..."
	@docker ps

up-recreate: ## Recreate and Start Elixir and Postgres containers up
	@echo "Makefile: Recreating and starting container..."
	@docker-compose --file docker/docker-compose.yaml up -d --build --force-recreate

	@echo "Makefile: Listing containers..."
	@docker ps
