.PHONY: clean install test deploy

clean:
	rm -rf dist/ node_modules/

install:
	npm install

test: install
	npm test

deploy: test clean
	npm install --production
	ls -lah node_modules/
	mkdir dist/
	cp lambda.js dist/
	cp -r node_modules dist/
	zip -r dist/skills-framework-test.zip dist/
	terraform init -force-copy -input=false
	terraform plan
	terraform apply
