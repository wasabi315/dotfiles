EXCLUSIONS := .git .gitmodules .gitignore .config .xmonad
CANDIDATES := $(wildcard .??*) $(wildcard .config/*) $(wildcard bin/*) $(wildcard .xmonad/*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

all: init deploy

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/scripts/init.sh

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

