DOTPATH          := $(realpath $(dir $(lastword &(MAKEFILE_LIST))))
CANDIDATES      := $(wildcard .??*)
EXCLUSIONS      := .git .gitmodules .config
DOTFILES        := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTCONFDOTFILES := $(wildcard .config/*)

all:

list:
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

deploy:
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ' '
	@$(foreach val, $(DOTFILES),        ln -snvf $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(DOTCONFDOTFILES), ln -snvf $(abspath $(val)) $(HOME)/$(val);)

update:
	@git pull origin master

clean:
	@echo 'Remove dotfiles...'
	@-$(foreach val, $(DOTFILES)       , rm -vrf $(HOME)/$(val))
	@-$(foreach val, $(DOTCONFDOTFILES), rm -vrf $(HOME)/$(val))
	-rm -rf $(DOTPATH)

