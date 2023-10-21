npm_install:
	docker-compose run --rm npm install
npm_run_dev:
	docker-compose run --rm npm run dev
npm_run_build:
	docker-compose run --rm npm run build
up:
	docker-compose run --rm npm install \
	&& docker-compose up -d \
	&& docker exec -it app-dusha composer install
