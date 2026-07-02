.PHONY: build test shell

build:
	docker compose build

test:
	docker compose run --rm app python -m pytest -q

shell:
	docker compose run --rm app bash
