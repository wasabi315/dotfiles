EXCLUSIONS := .git .gitmodules .gitignore .config .local .xmonad
CANDIDATES := $(wildcard .??*) $(wildcard .config/*) $(wildcard bin/*) $(wildcard .local/share/fonts/*) $(wildcard .xmonad/*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

init:
	@$(DOTPATH)/scripts/init.sh

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull origin master

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

clean:
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)

