#!/bin/bash -eu

packagelist=(
    # GUI
    "lightdm"
    "lightdm-gtk-greeter"
    "xserver-xorg"

    # packages required by i3-gaps
    "autoconf"
    "libev-dev"
    "libpango1.0-dev"
    "libstartup-notification0-dev"
    "libxcb-cursor-dev"
    "libxcb-icccm4-dev"
    "libxcb-keysyms1-dev"
    "libxcb-randr0-dev"
    "libxcb-util0-dev"
    "libxcb-xinerama0-dev"
    "libxcb-xkb-dev"
    "libxcb1-dev"
    "libxkbcommon-dev"
    "libxkbcommon-x11-dev"
    "libyajl-dev"
    "xutils-dev"

    # packages required by termite
    "libgtk-3-dev"
    "g++"
    "gtk-doc-tools"
    "gnutls-bin"
    "valac"
    "intltool"
    "libpcre2-dev"
    "libglib3.0-cil-dev"
    "libgnutls28-dev"
    "libgirepository1.0-dev"
    "libxml2-utils"
    "gperf"

    # tools
    "build-essntial"
    "cmake"
    "git"
    "python3-pip"
    "x11-utils"

    # applications
    "feh"
    "firefox"
    "neovim"
    "ranger"
    "rofi"
)

echo 'start installing apps...'
echo ' '

sudo apt update && sudo apt upgrade && sudo apt dist-upgrade

mkdir -p ~/repos

# install i3-gaps
cd /tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
./autogen.sh --prefix=/usr
make
sudo make install

cd ~/repos
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

# install i3blocks
cd ~/repos
git clone git://github.com/vivien/i3blocks
cd i3blocks
make clean debug
sudo make install

# install termite
cd ~/repos
mkdir -p termite && cd termite
git clone --recursive https://github.com/thestinger/termite.git termite
git clone https://github.com/thestinger/vte-ng.git

echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install
cd ../termite && make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x; sudo ln -s \
    /usr/local/share/terminfo/x/xterm-termite \
    /lib/terminfo/x/xterm-termite

sudo update-altermatives -- install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60

echo "finish installing apps!"
echo ' '

# set up neovim (for neovim plugins)
echo "setting up neovim..."
echo ' '
pip3 install neovim
echo "done!"
echo ' '

