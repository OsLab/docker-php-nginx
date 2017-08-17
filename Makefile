.DEFAULT_GOAL := help
.PHONY: help build publish

help:
	@echo ''
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	@echo ''

## Commands
##---------------------------------------------------------------------------
build:        ## build all enabled versions
	bash build.sh

publish:      ## publish all enabled versions
	bash publish.sh

%:
@:
