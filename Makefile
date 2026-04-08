PREFIX = /usr/local
CONFIG_FILE = config.mk

config:
	touch config.mk
	ls -I Makefile -I README.md -I archive > config.mk

install:
	for i in $$(cat $(CONFIG_FILE)); do cp "$$i" "$(PREFIX)/bin/$${i%.sh}"; done
