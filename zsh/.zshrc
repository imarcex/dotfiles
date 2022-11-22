# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Config folder
export ZSH="$XDG_CONFIG_HOME/zsh/oh-my-zsh"

# Theme
ZSH_THEME="alanpeabody"

# History file location
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# Plugins
plugins=(git)

# Oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Aliases
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
alias nivm="nvim"

# Open bash in tty
if [ `tput colors` != "256" ]; then
  exec bash -l;
fi
