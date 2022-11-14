# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENV
PATH=$PATH:/home/imarcex/.local/bin/

# Aliases
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

PS1='[\u@\h \W]\$ '
