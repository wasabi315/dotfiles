#!/bin/bash -eu

DOTPATH="${HOME}/.dotfiles"

deploy_dotfiles() {

    local candidate=( .??*  .config/*  bin )
    local exclude=( .git  .config  .gitignore  .gitmodules )

    for f in "${candidate[@]}"; do
        [[ `echo "${exclude}" | grep "${f}"` ]] || ln -snfv ${DOTPATH}/${f} ${HOME}/${f}
    done

}

deploy_dotfiles
