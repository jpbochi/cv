all: jpbochi.zip

DRUN_VERSION=1.1.1

drun:
	curl -sSL "https://github.com/jpbochi/drun/archive/v${DRUN_VERSION}.tar.gz" | tar -zxf - --strip-components=1 "drun-${DRUN_VERSION}/drun"

npm-install: drun
	./drun -N npm install --loglevel warn --no-progress

swiss.css:
	curl -sSL http://jasonm23.github.io/markdown-css-themes/swiss.css > swiss.css

install: npm-install

update-deps: npm-install
	./drun -N ./node_modules/.bin/ncu --upgradeAll

jpbochi.html: install swiss.css README.md
	./drun -N node ./node_modules/.bin/markdown-html --style swiss.css README.md > jpbochi.html

jpbochi.pdf: install README.md build_pdf.js
	./drun -N node build_pdf jpbochi.pdf

jpbochi.zip: jpbochi.html jpbochi.pdf build_zip.js
	./drun -N node build_zip
