.PHONY: test deploy

test:
	npm test

deploy:
	terraform init -force-copy -input=false
	terraform apply
