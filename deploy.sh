#!/bin/bash -eu

DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY=".config"

echo "start deploying dotfiles..."

cd ${DOT_DIRECTORY}
for f in .??*; do
    [ ${f} = ".git" ]            && continue
    [ ${f} = ".config" ]         && continue
    [ ${f} = ".gitignore" ]      && continue
    [ ${f} = ".gitmodules" ]     && continue
    [ ${f} = "termite-install" ] && continue

    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

mkdir -p ${HOME}/.config

cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
for file in *; do
    ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}/${file} ${HOME}/${DOT_CONFIG_DIRECTORY}/${file}
done

echo "Finish deploying dotfiles!!"

