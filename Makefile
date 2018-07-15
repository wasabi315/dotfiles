DOTPATH         := $(shell pwd)
CANDIDATES      := $(wildcard .??*) bin
EXCLUSIONS      := .git .gitmodules .config
DOTFILES        := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTCONFDOTFILES := $(wildcard .config/*)


all:

deploy:
	@$(foreach val, $(DOTFILES),        ln -snvf $(abspath $(val)) $(HOME)/$(val);)
	@$(foreach val, $(DOTCONFDOTFILES), ln -snvf $(abspath $(val)) $(HOME)/$(val);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/scripts/init.sh

update:
	@git pull origin master

clean:
	@-$(foreach val, $(DOTFILES)       , rm -vrf $(HOME)/$(val))
	@-$(foreach val, $(DOTCONFDOTFILES), rm -vrf $(HOME)/$(val))
	-rm -rf $(DOTPATH)

list:
	@$(foreach val, $(DOTFILES) $(DOTCONFDOTFILES), ls -dF $(val);)

