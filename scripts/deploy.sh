#!/bin/bash -eu

DOTPATH="/home/satoshi/.dotfiles"

deploy_dotfiles() {

    cd ${DOTPATH}

    local candidate=( .??* .config/* )
    local exclude=( .git  .config  .gitignore  .gitmodules )

    for f in "${candidate[@]}"; do
        if [[ `echo "${exclude[@]}" | grep "${f}"` ]]; then
            :
        else
            ln -snfv ${DOTPATH}/${f} ${HOME}/${f}
        fi
    done

}

deploy_dotfiles
