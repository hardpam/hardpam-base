PREFIX ?= "not specified"

install:
	echo "Install dir $(PREFIX)"
	cp hardpam-hello.sh $(PREFIX)/bin/hardpam-hello.sh

