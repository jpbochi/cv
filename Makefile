all: jpbochi.zip

DRUN_VERSION=1.4.0

drun:
	curl -sSL "https://github.com/jpbochi/drun/archive/v${DRUN_VERSION}.tar.gz" | tar -zxf - --strip-components=1 "drun-${DRUN_VERSION}/drun"

npm-install: drun package.json
	./drun -N npm install --loglevel warn --no-progress

wkhtmltox-image: wk/Dockerfile
	docker build -t local/wkhtmltox ./wk

install: npm-install

jpbochi.html: npm-install README.md build-html-in-node
	./drun -N -e NPM_CONFIG_LOGLEVEL= npm run build-html

jpbochi.pdf: jpbochi.html
	./drun local/wkhtmltox wkhtmltopdf --encoding utf-8 jpbochi.html jpbochi.pdf

jpbochi.zip: jpbochi.html jpbochi.pdf build_zip.js
	./drun -N node build_zip
