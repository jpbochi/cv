all: install clean build open

install:
	npm install

clean:
	rm jpbochi.pdf || true

build:
	node build jpbochi.pdf

open:
	open jpbochi.pdf
