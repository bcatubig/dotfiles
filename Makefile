.PHONY: help
help:
	@echo "Targets:"
	@echo "    osx: Install for OSX"

.PHONY: osx
osx:
	@./_scripts/setup-osx.sh
