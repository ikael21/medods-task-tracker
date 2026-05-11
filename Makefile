RAILS_CONTAINER = api

.PHONY: app

app-build:
	@docker-compose build

app-setup:
	@docker-compose run --rm $(RAILS_CONTAINER) setup --skip-server

app:
	@docker-compose up

app-detach:
	@docker-compose up -d

app-bash:
	@docker-compose run --rm $(RAILS_CONTAINER) bash

app-console:
	@docker-compose run --rm $(RAILS_CONTAINER) rails c

app-stop:
	@docker-compose stop

app-down:
	@docker-compose down

app-down-v:
	@docker-compose down -v

api-docs:
	RSWAG_DRY_RUN=0 RAILS_ENV=test rails rswag:specs:swaggerize ADDITIONAL_RSPEC_OPTS="-fd"
