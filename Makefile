.PHONY: clean install test deploy

clean:
	rm -rf dist/ node_modules/

install: clean
	npm install

test: install
	npm test

deploy: test clean
	npm install --production
	../terraform init -force-copy -input=false
	../terraform plan
