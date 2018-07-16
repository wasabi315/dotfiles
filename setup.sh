#!/bin/bash -eu

has() {
    type "$1" > /dev/null 2>&1
}

if [ -z "${DOTPATH:-}" ]; then
    DOTPATH="${HOME}/.dotfiles"; export DOTPATH
fi

download_dotfiles() {

    local readonly remote_url="https://github.com/wasabi315/dotfiles.git"
    local readonly git_tarball="https://github.com/wasabi315/dotfiles/tarball/master"

    if [ -d "${DOTPATH}" ]; then
        echo "$(tput bold)$(tput setaf 1)ERROR: dotfiles is already installed on this system.$(tput sgr0)\n" >&2
        exit 1
    fi

    echo "$(tput setaf 1)This will download dotfiles to ~/.dotfiles directory.$(tput sgr0)\n"
    echo "$(tput setaf 1)Continue? (y/n)$(tput sgr0): "
    read -r REPLY
    if [ "$REPLY" == Y ] || [ "$REPLY" = y ]; then
        echo "$(tput setaf 7)Downloading dotfiles...$(tput sgr0)"
    else
        echo "$(tput bold)$(tput setaf 7)Process terminated by user.$(tput sgr0)\n"
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

    echo "$(tput bold)$(tput setaf 2)Done$(tput sgr0)\n"

}

enable_dotfiles() {

    echo "undefined: enable_dotfiles"

    mkdir -p ~/bin

}

download_dotfiles
enable_dotfiles
