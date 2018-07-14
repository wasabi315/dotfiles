#!/bin/bash -eu

DOT_TARBALL="https://github.com/wasabi315/dotfiles/tarball/master"

if [ -z "${DOTPATH:-}" ]; then
    DOTPATH="${HOME}/.dotfiles"; export DOTPATH
fi

if [ -d "${DOTPATH}" ]; then
    printf "\e[1;31mERROR: dotfiles is already installed on this system.\e[m" >&2
    exit 1
fi

cat <<"LOGO"

         _       _    __ _ _
        | |     | |  / _(_) |
      __| | ___ | |_| |_ _| | ___  ___
     / _` |/ _ \| __|  _| | |/ _ \/ __|
    | (_| | (_) | |_| | | | |  __/\__ \
     \__,_|\___/ \__|_| |_|_|\___||___/

LOGO

printf "\e[1;31mWARNING: This will install new files and may overwrite\nsome existing files in your home directory\n\e[m"
printf "\n\e[1;31mContinue? (y/n)\e[m: "
read -r REPLY

set +e

if [ "$REPLY" == Y ] || [ "$REPLY" = y ]; then
    printf "\nInstalling dotfiles...\n"
else
    printf "\nProcess terminated by user.\n"
    exit 1
fi

set -e

mkdir ${DOTPATH}

wget -qO ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
tar -xzvf ${HOME}/dotfiles.tar.gz -C ${DOTPATH}
rm ${HOME}/dotfiles.tar.gz

cd ${DOTPATH}

make

