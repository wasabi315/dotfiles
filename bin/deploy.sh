#!/bin/bash -eu

deploy_dotfiles() {

    local candidate=( .??*  .config/*  bin )
    local exclude=( .git  .config  .gitignore  .gitmodules )

    for f in "${candidate[@]}"; do
        [[ `echo "${exclude}" | grep "${f}"` ]] || ln -snfv ${DOTPATH}/${f} ${HOME}/${f}
    done

}

