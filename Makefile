.DEFAULT_GOAL := help
.PHONY: all allinstall nextinstall allupdate allbackup

help: ## Display this help message
	@echo 'Possible options to invoke:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "make \033[36m%-30s\033[0m %s\n", $$1, $$2}'

${HOME}/.local:
	mkdir -p $<

doom: ## Install doom emacs config
	test -d ${HOME}/.emacs.d/ \
	|| git clone --depth 1 https://github.com/doomemacs/doomemacs ${HOME}/.emacs.d
	${HOME}/.emacs.d/bin/doom install
	mkdir -p ${HOME}/.doom.d
	ln -vsf {${PWD},${HOME}}/.doom.d/config.el
	ln -vsf {${PWD},${HOME}}/.doom.d/custom.el
	ln -vsf {${PWD},${HOME}}/.doom.d/init.el
	ln -vsf {${PWD},${HOME}}/.doom.d/packages.el
