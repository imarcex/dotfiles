#!/bin/bash

user=imarcex
installpath=$(pwd)
homepath=/home/$user
mkdir -p $installpath/tmp
tmpfolder=$installpath/tmp

function init_host {
    xbps-install -Suy
    amdDrivers
    xorg
    utils
    audio
    virtualbox
    pandoc
    fixfonts
    fixdirs
    sudo -u $user $installpath/setup.sh full-bspwm
    # rm -rf $tmpfolder/*
    echo "[*] Everything has been installed"
}

function full-bspwm {
    zsh
    bspwm
    alacritty
    rofi
    neovim
    sxhkd
    polybar
    tmux
    homedir
    picom
}

function zsh {
    sudo xbps-install zsh starship
    cp -r $installpath/zsh $homepath/.config/
}

function fixdirs {
    echo "export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export ZDOTDIR="$HOME"/.config/zsh" > /etc/zsh/zshenv
}

function virtualbox {
    xbps-install -y virtualbox-ose virtualbox-ose-guest libvirt
    ln -s /etc/sv/libvirtd /var/service/
    ln -s /etc/sv/virtlogd /var/service/
    usermod -aG vboxuser imarcex
}

function pandoc {
    xbps-install -y pandoc texlive texlive-bin zathura zathura-pdf-mupdf
}

function nvidiaDrivers {
    xbps-install -y void-repo-nonfree
    xbps-install -y nvidia
}

function amdDrivers {
    xbps-install -y xf86-video-amdgpu mesa-vaapi mesa-vdpau linux-firmware-amd
}

function xorg {
     xbps-install -y xorg xinit
}

function homedir {
    shopt -s extglob
    shopt -s dotglob
    mkdir -p $homepath/docs $homepath/dls $homepath/pics/ss
    cp $installpath/homedir/* $homepath/
    sudo xbps-install xdg-user-dirs xdg-user-dirs-gtk feh
    cp $installpath/user-dirs.dirs $homepath/.config
    mkdir -p $homepath/.local/bin
    cp $installpath/bin/volume.sh $homepath/.local/bin
    chmod +x $homepath/.local/bin
    cp $installpath/images/* $homepath/pics/
}

function picom {
    sudo xbps-install picom
    cp -r $installpath/picom $homepath/.config/
}

function alacritty {
    sudo xbps-install -y alacritty
    cp -r $installpath/alacritty $homepath/.config/
}

function neovim {
    #sudo xbps-install -y neovim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp -r $installpath/nvim $homepath/.config/
}

function bspwm {
    sudo xbps-install -y bspwm
    cp -r $installpath/bspwm $homepath/.config/
}

function rofi {
    sudo xbps-install -y rofi
    cp -r $installpath/rofi $homepath/.config/
}

function sxhkd {
    sudo xbps-install -y sxhkd
    cp -r $installpath/sxhkd $homepath/.config/
}

function polybar {
    sudo xbps-install -y polybar
    cp -r $installpath/polybar $homepath/.config/
}

function tmux {
    sudo xbps-install -y tmux
    cp -r $installpath/tmux $homepath/.config/
}

function utils {
    xbps-install -y bat zathura xtools xsel xclip unzip p7zip rsync setxkbmap firefox qutebrowser python3-devel python3-pip nitrogen neofetch htop fuse curl wget Thunar man man-pages btop tdrop fzf maim
}

function audio {
    xbps-install -y pipewire helvum pavucontrol alsa-utils elogind libnotify rtkit
    ln -s /etc/sv/alsa /var/service
    ln -s /etc/sv/elogind /var/service
    ln -s /etc/sv/rtkit /var/service
}

function fixfonts {
    ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
    xbps-install -y font-fira-otf font-fira-ttf font-firacode
    wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Iosevka.zip" && mv Iosevka.zip $tmpfolder
    # echo -e "[*] Unziping fonts, it might be slow, don't worry"
    # unzip $tmpfolder/Iosevka.zip -d $tmpfolder/Iosevka
    # mv $tmpfolder/Iosevka /usr/share/fonts
}

$1
