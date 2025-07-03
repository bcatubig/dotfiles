.PHONY: help
help:
	@echo "Targets:"
	@echo "    osx: Install for OSX"
	@echo "    debian: Install on Debian based systems"

.PHONY: osx
osx:
	@./_scripts/setup-osx.sh

.PHONY: debian
debian:
	@./_scripts/setup-debian.sh
