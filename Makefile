EXCLUSIONS := .git .gitmodules .config
CANDIDATES := $(wildcard .??*) $(wildcard .config/*) $(wildcard bin/*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

all:

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/scripts/init.sh

update:
	git pull origin master

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

