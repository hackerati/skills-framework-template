.PHONY: clean install test deploy

clean:
	rm -rf dist/ node_modules/
	echo 'cleaned'

install:
	npm install

test: install
	npm test

deploy: test clean
	npm install --production
	mkdir dist/
	cp lambda.js dist/
	cp -r node_modules dist/
	zip -r dist/skills-framework-test.zip dist/
	terraform init -force-copy -input=false
	terraform plan
	-terraform apply
	ls -lah
	ls -lah dist/
