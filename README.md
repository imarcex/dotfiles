# Dotfiles
Hello! These are my personal dotfiles for my Void Linux Laptop. The technologies it is using are:

- **OS:** Void Linux
- **WM:** bspwm
- **Terminal:** alacritty
- **Text-editor:** nvim
- **Keybinds:** sxhkd
- **Top-bar:** polybar
- **Multiplexor:** tmux
- **Shell:** Bash

To run the script use:
```bash
git clone https://github.com/imarcex/dotfiles.git
cd dotfiles

chmod +x setup.sh

# It is important to run as ROOT otherwise it might crash
su root
./setup.sh init_host
```

In most cases you may want to use `./setup.sh init_host` as it will do a full install, if you know what you are doing, you can call another function.

aaaa
