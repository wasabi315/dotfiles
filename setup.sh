#!/bin/bash -eu

info() {
    echo "$(tput bold)$(tput setaf 2)$1$(tput sgr0)"
}

err() {
    echo " $(tput bold)$(tput setaf 1)$1$(tput sgr0)" >&2
}

has() {
    type -P "$1" >/dev/null 2>&1
    return $?
}

if [ -z "${DOTPATH:-}" ]; then
    export DOTPATH="${HOME}/.dotfiles"
fi

GITHUB_URL="https://github.com/wasabi315/dotfiles.git"
TARBALL="https://github.com/wasabi315/dotfiles/tarball/master"


cat <<HEADER
       _     _    __ _ _
    __| |___| |_ / _(_) |___ ___
  _/ _\` / _ \  _|  _| | / -_|_-<
 (_)__,_\___/\__|_| |_|_\___/__/

HEADER

if [ -d "${DOTPATH}" ]; then
    err "Dotfiles already exists at ${DOTPATH}"
    exit 1
fi

info "Downloading dotfiles..."
if has git; then
    git clone ${GITHUB_URL} ${DOTPATH}
elif has curl || has wget; then
    if has curl; then
        curl -sL ${TARBALL}
    elif has wget; then
        wget -qO ${TARBALL}
    fi | tar xzvf
else
    err "curl or wget is required"
    exit 1
fi

cd ${DOTPATH}
info "Deploying dotfiles..."
make deploy

info "Installing packages and Initializing..."
make init

info "Done!"

