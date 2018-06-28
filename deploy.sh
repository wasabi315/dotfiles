#!/bin/bash -eu

DOT_DIRECTORY="${HOME}/dotfiles"
cd ${DOT_DIRECTORY}

for f in .??*; do
    [ ${f} = ".git" ]        && continue
    [ ${f} = ".gitignore" ]  && continue
    [ ${f} = ".gitmodules" ] && continue

    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

echo "Finish deploying dotfiles!!"

