all: jpbochi.zip

DRUN_VERSION=2.1.0

drun:
	curl -sSL "https://github.com/jpbochi/drun/archive/v${DRUN_VERSION}.tar.gz" | tar -zxf - --strip-components=1 "drun-${DRUN_VERSION}/drun"

npm-install: drun package.json
	./drun -NM alpine3.12 npm install --loglevel warn --no-progress

wkhtmltox-image: wk/Dockerfile
	docker build -qt local/wkhtmltox ./wk

install: npm-install

jpbochi.html: npm-install README.md build-html-in-node
	./drun -NM alpine3.12 -e NPM_CONFIG_LOGLEVEL= npm run build-html

jpbochi.pdf: jpbochi.html wkhtmltox-image
	./drun local/wkhtmltox wkhtmltopdf --encoding utf-8 jpbochi.html jpbochi.pdf

jpbochi.zip: jpbochi.html jpbochi.pdf build_zip.js
	./drun -NM alpine3.12 node build_zip
