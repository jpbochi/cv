all: clean build open

install:
	npm install

clean:
	rm *.pdf || true

build:
	node build

open:
	open jpbochi.pdf
