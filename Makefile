all: clean build_zip

install:
	npm install
	[ -f swiss.css ] || wget http://jasonm23.github.io/markdown-css-themes/swiss.css

clean:
	rm jpbochi.pdf || true
	rm jpbochi.html || true
	rm jpbochi.zip || true

build_html: install
	node ./node_modules/markdown-html/bin/markdown-html.js --style swiss.css README.md > jpbochi.html

build_pdf: install
	node build_pdf jpbochi.pdf

build_zip: build_html build_pdf
	node build_zip

