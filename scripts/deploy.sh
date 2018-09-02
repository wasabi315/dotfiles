#!/bin/bash -eu

deploy_dotfiles() {

  cd ${DOTPATH}

  local candidate=( .??* .config/* bin/* )
  local exclude=( .git  .config  .gitignore  .gitmodules )

  for f in "${candidate[@]}"; do
      [[ $(echo "${exclude[@]}" | grep "${f}") ]] && continue
      ln -snfv ${DOTPATH}/${f} ${HOME}/${f}
  done

}

deploy_dotfiles
