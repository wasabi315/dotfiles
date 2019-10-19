#!/bin/bash -eu

cd `dirname $0`

yay -Syyu
pkgs=(`cat pkgs.txt`)
yay -S ${pkgs[@]}

pip3 install neovim

fc-cache -fv

