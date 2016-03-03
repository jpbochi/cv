all: jpbochi.zip

npm-install:
	./sh/crun-node npm install --harmony --unsafe-perm --loglevel warn

swiss.css:
	wget http://jasonm23.github.io/markdown-css-themes/swiss.css

install: swiss.css npm-install

update-deps: npm-install
	./sh/crun-node ncu --upgradeAll

jpbochi.html: install README.md
	./sh/crun-node node ./node_modules/.bin/markdown-html --style swiss.css README.md > jpbochi.html

jpbochi.pdf: install README.md build_pdf.js
	./sh/crun-node node build_pdf jpbochi.pdf

jpbochi.zip: jpbochi.html jpbochi.pdf build_zip.js
	./sh/crun-node node build_zip
