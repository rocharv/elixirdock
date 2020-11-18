help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

open: ## Open elixir container interactive pseudo tty
	@echo "Makefile: Opening elixir container interactive pseudo tty..."
	@docker exec -it elixir_server /bin/bash

setup: ## Setup Elixir and Postgres containers
	@echo "Makefile: Creating and starting containers..."
	@docker-compose --file docker-compose.yaml up -d

	@echo "Makefile: Listing containers..."
	@docker ps

setup-recreate: ## Recreate and start elixir and postgres containers
	@echo "Makefile: Recreate and starting containers..."
	@docker-compose --file docker-compose.yaml up -d --build --force-recreate

	@echo "Makefile: Listing containers..."
	@docker ps

shutdown: ## Shut down Elixir and Postgres containers
	@echo "Makefile: Stopping and removing container..."
	@docker-compose --file docker-compose.yaml down --v

	@echo Makefile: Listing containers...
	@docker ps
