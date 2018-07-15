#!/bin/bash -eu

if [ -z "${DOTPATH:-}" ]; then
    DOTPATH="${HOME}/.dotfiles"; export DOTPATH
fi

download_dotfiles() {

    local readonly remote_url="https://github.com/wasabi315/dotfiles.git"
    local readonly git_tarball="https://github.com/wasabi315/dotfiles/tarball/master"

    if [ -d "${DOTPATH}" ]; then
        e_error "ERROR: dotfiles is already installed on this system." >&2
        exit 1
    fi

    echo "$(tput setaf 2)This will download dotfiles to ~/.dotfiles directory.$(tput sgr0)"
    echo "$(tput setaf 2)Continue? (y/n)$(tput sgr0): "
    read -r REPLY
    if [ "$REPLY" == Y ] || [ "$REPLY" = y ]; then
        echo "$(tput setaf 7)Downloading dotfiles...$(tput sgr0)"
    else
        e_error "Process terminated by user."
        exit 1
    fi

    mkdir ${DOTPATH}

    if has "git"; then
        git clone --recursive "${remote_url}" "${DOTPATH}"
    else
        if has "curl"; then
            curl -fsSLo ${HOME}/dotfiles.tar.gz ${git_tarball}
        else
            wget -qO ${HOME}/dotfiles.tar.gz ${git_tarball}
        fi
        tar -xzvf ${HOME}/dotfiles.tar.gz -C ${DOTPATH}
        rm ${HOME}/dotfiles.tar.gz
    fi

}

download_dotfiles

dotfiles usage

