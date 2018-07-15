#!/bin/bash -eu

install_apt-pkgs() {

    local readonly apt_pkgs=(
        # GUI
        lightdm
        lightdm-gtk-greeter
        xserver-xorg

        # packages required by i3-gaps
        autoconf
        libev-dev
        libpango1.0-dev
        libstartup-notification0-dev
        libxcb-cursor-dev
        libxcb-icccm4-dev
        libxcb-keysyms1-dev
        libxcb-randr0-dev
        libxcb-util0-dev
        libxcb-xinerama0-dev
        libxcb-xkb-dev
        libxcb1-dev
        libxkbcommon-dev
        libxkbcommon-x11-dev
        libyajl-dev
        xutils-dev

        # packages required by termite
        libgtk-3-dev
        g++
        gtk-doc-tools
        gnutls-bin
        valac
        intltool
        libpcre2-dev
        libglib3.0-cil-dev
        libgnutls28-dev
        libgirepository1.0-dev
        libxml2-utils
        gperf

        # tools
        build-essntial
        cmake
        git
        python3-pip
        x11-utils

        # applications
        dunst
        feh
        firefox
        neovim
        ranger
        rofi
        tty-clock
        )

    local readonly vmware_pkgs=(
        open-vm-tools
        open-vm-tools-desktop
        )

    sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade
    sudo apt install -y ${pkgs[@]}

    if [[ `lspci | grep 'VMware'` ]]; then
        sudo apt install -y ${vmware_pkgs[@]}
    fi

}


install_i3-gaps() {

    cd /tmp
    git clone https://github.com/Airblader/xcb-util-xrm
    cd xcb-util-xrm
    ./autogen.sh --prefix=/usr
    make
    sudo make install

    cd ${GIT_DIR}
    git clone https://www.github.com/Airblader/i3 i3-gaps
    cd i3-gaps
    autoreconf --force --install
    mkdir build
    cd build
    ../configure --prefix=/usr --sysconfdir=/etc
    make
    sudo make install

}


install_termite() {

    cd ${GIT_DIR}
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

    sudo update-altermatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60

}


install_fonts() {

    echo "undefined: install_font"

}


install_others() {

    echo "undefined: install_others"

}


init_dotfiles() {

    install_apt-pkgs &&

    intall_i3-gaps &&

    install_termite &&

    install_fonts &&

    install_others &&

    pip3 install neovim

}


