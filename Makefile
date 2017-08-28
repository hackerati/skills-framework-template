.PHONY: install test deploy

install:
	npm install

test: install
	npm test

deploy: test
	terraform init -force-copy -input=false
	terraform apply
