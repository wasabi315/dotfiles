#!/bin/bash -eu

if [ -z "${DOTPATH:-}" ]; then
    DOTPATH="${HOME}/.dotfiles"; export DOTPATH
fi

download_dotfiles() {

    local readonly git_tarball="https://github.com/wasabi315/dotfiles/tarball/master"

    cat <<HEADER
 ___   ___ _____ ___ ___ _    ___ ___
|   \ / _ \_   _| __|_ _| |  | __/ __|
| |) | (_) || | | _| | || |__| _|\___\\
|___/ \___/ |_| |_| |___|____|___|___/ wasabi315's dotfiles

HEADER

    if [ -d "${DOTPATH}" ]; then
        echo "$(tput bold)$(tput setaf 1)ERROR: dotfiles is already installed on this system.$(tput sgr0)\n" >&2
        exit 1
    fi

    echo "$(tput setaf 1)This will download dotfiles to ~/.dotfiles directory.$(tput sgr0)\n"
    echo "$(tput setaf 1)Continue? (y/n)$(tput sgr0): "
    read -r -p "[Y|n]" response
    if [[ $response =~ ^(yes|y|Y)]]; then
        echo "$(tput setaf 7)Downloading dotfiles...$(tput sgr0)"
    else
        echo "$(tput bold)$(tput setaf 7)Process terminated by user.$(tput sgr0)\n"
        exit 1
    fi

    mkdir ${DOTPATH}

    wget -qO ${HOME}/dotfiles.tar.gz ${git_tarball}
    tar -xzvf ${HOME}/dotfiles.tar.gz -C ${DOTPATH}
    rm ${HOME}/dotfiles.tar.gz

    echo "$(tput bold)$(tput setaf 2)Done$(tput sgr0)\n"

}

download_dotfiles

