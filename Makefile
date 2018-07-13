DOTPATH         := $(realpath $(dir $(lastword &(MAKEFILE_LIST))))
CANDIDATES      := $(wildcard .??*) bin
EXCLUSIONS      := .git .gitmodules .config
DOTFILES        := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTCONFDOTFILES := $(wildcard .config/*)


all:

list:
	@$(foreach val, $(DOTFILES) $(DOTCONFDOTFILES), ls -dF $(val);)

deploy:
	@$(foreach val, $(DOTFILES),        ln -snvf $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(DOTCONFDOTFILES), ln -snvf $(abspath $(val)) $(HOME)/$(val);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/scripts/init.sh
	@exec $$SHELL

update:
	@echo 'Update dotfiles...'
	@git pull origin master
	@echo 'Done'

clean:
	@echo 'Remove dotfiles...'
	@-$(foreach val, $(DOTFILES)       , rm -vrf $(HOME)/$(val))
	@-$(foreach val, $(DOTCONFDOTFILES), rm -vrf $(HOME)/$(val))
	-rm -rf $(DOTPATH)
	@echo 'Done'

