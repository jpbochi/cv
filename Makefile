all: clean build_html build_pdf

install:
	npm install
	[ -f swiss.css ] || wget http://jasonm23.github.io/markdown-css-themes/swiss.css

clean:
	rm jpbochi.pdf || true
	rm jpbochi.html || true

build_html: install
	node ./node_modules/markdown-html/bin/markdown-html.js --style swiss.css README.md > jpbochi.html

build_pdf: install
	node build jpbochi.pdf

