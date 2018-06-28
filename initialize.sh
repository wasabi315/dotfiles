#!/bin/bash -eu

packagelist = (
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

    # tools
    "build-essntial"
    "cmake"
    "git"
    "python3-pip"
    "open-vm-tools"
    "open-vm-tools-desktop"

    # applicatoion
    "feh"
    "firefox"
    "neovim"
    "ranger"
    "rofi"
    "yabar"
)

echo "start installing apps..."

for pkg in ${packagelist[@]}; do
    sudo apt install -y ${pkg}
done

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
make install

echo "finish installing apps!"

# set up neovim (for neovim plugins)
echo "setting up neovim..."

pip3 install neovim

echo "done!"


