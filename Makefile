.PHONY: clean install test deploy

clean:
	rm -rf dist/ node_modules/

install:
	npm install

test: install
	npm test

deploy: test clean
	npm install --production
	terraform init -force-copy -input=false
	terraform plan
	ls -lah
	ls -lah dist/
	-terraform apply
	ls -lah
	ls -lah dist/
