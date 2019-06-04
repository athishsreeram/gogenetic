# GOGENETIC Makefile
.PHONY: clean build

clean:
	git clean -fX

build:
	go build
