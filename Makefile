.PHONY: clean install test deploy

clean:
	rm -rf dist/ node_modules/

install:
	npm install

test: install
	npm test

deploy: test clean
	npm install --production
	ls -lah
	ls -lah dist/
	terraform init -force-copy -input=false
	terraform plan
	-terraform apply
	ls -lah
	ls -lah dist/
