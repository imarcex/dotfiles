#!/bin/bash

user=imarcex
installpath=$(pwd)
homepath=/home/$user
mkdir -p $installpath/tmp
tmpfolder=$installpath/tmp

function init_host {
    xbps-install -Suy
    gpuDrivers
    xorg
    utils
    audio
    virtualbox
    pandoc
    fixfonts
    sudo -u $user $installpath/setup.sh full-bspwm
    sudo -u $user $installpath/setup.sh 
    rm -rf $tmpfolder/*
    echo "[*] Everything has been installed"
}

function init_vmware {
    xbps-install -Suy
    vmwareDrivers # Todo
    xorg
    utils
    audio
    virtualbox
    pandoc
    fixfonts
    sudo -u $user $installpath/setup.sh full-bspwm
    sudo -u $user $installpath/setup.sh 
    rm -rf $tmpfolder/*
    echo "[*] Everything has been installed"
}

function full-bspwm {
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

function virtualbox {
    xbps-install -y virtualbox-ose virtualbox-ose-guest libvirt
    ln -s /etc/sv/libvirtd /var/service/
    ln -s /etc/sv/virtlogd /var/service/
    usermod -aG vboxuser imarcex
}

function pandoc {
    xbps-install -y pandoc texlive texlive-bin zathura zathura-pdf-mupdf
}

function gpuDrivers {
    xbps-install -y xf86-video-amdgpu mesa-vaapi mesa-vdpau linux-firmware-amd
}

function xorg {
     xbps-install -y xorg xinit
}

function homedir {
    shopt -s extglob
    shopt -s dotglob
    mkdir -p $homepath/desk $homepath/docs $homepath/dls $homepath/pics
    cp $installpath/homedir/* $homepath/
    sudo xbps-install xdg-user-dirs xdg-user-dirs-gtk feh
    cp $installpath/user-dirs.dirs $homepath/.config
    mkdir -p $homepath/.local/bin
    cp $installpath/bin/volume.sh $homepath/.local/bin
    chmod +x $homepath/.local/bin
    sudo echo "XDG_RUNTIME_DIR='/run/user/1000'" >> /etc/environment
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
    sudo xbps-install -y neovim
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

function bitwarden {
    mkdir -p $homepath/.local/bin $homepath/.local/share/applications
    wget -q "https://vault.bitwarden.com/download/?app=desktop&platform=linux" -P $homepath/.local/bin
    sed 's/imarcex/$user/g' './Bitwarden.desktop.example' > $homepath/.local/share/applications
}

function utils {
    xbps-install -y bat zathura xtools xsel xclip unzip p7zip rsync setxkbmap firefox qutebrowser python3 python3-pip nitrogen neofetch htop fuse curl wget Thunar man man-pages btop tdrop fzf
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
    echo -e "[*] Unziping fonts, it might be slow, don't worry"
    wget -q "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/Iosevka.zip" -P $tmpfolder/
    unzip $tmpfolder/Iosevka.zip -d $tmpfolder/Iosevka
    mv $tmpfolder/Iosevka /usr/share/fonts
}

$1
