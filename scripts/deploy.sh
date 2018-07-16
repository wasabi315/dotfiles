#!/bin/bash -eu

deploy_dotfiles() {

    cd ${DOTPATH}

    local candidate=( .??* .config/* )
    local exclude=( .git  .config  .gitignore  .gitmodules )

    for f in "${candidate[@]}"; do
        if [[ `echo "${exclude[@]}" | grep "${f}"` ]]; then
            :
        else
            if [[ -e "${HOME}/${f}" ]] || [[ -d "${HOME}/${f}" ]]; then
                mv ${HOME}/${f} ${BACKUP_PATH}/${f}
                echo "[BACKED UP] "
            fi
            ln -snfv ${DOTPATH}/${f} ${HOME}/${f}
        fi
    done

}

deploy_dotfiles
