# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ENV
PATH=$PATH:/home/imarcex/.local/bin/:/home/imarcex/.local/share/gem/ruby/3.1.0/bin
GEM_HOME="$HOME/.local/gem"

# Aliases
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Functions
md2pdf () {
if [ -z "$1" ]
then
    echo -e "[*] No file supplied\n"
    echo -e "[+] Usage: $0 file.md output.pdf\n"
else
    if [ -z "$2" ]
    then
        pandoc --pdf-engine=pdflatex -s -f markdown $1 -t pdf -o out.pdf
    else
        pandoc --pdf-engine=pdflatex -s -f markdown $1 -t pdf -o $2
    fi
fi
}

# Prompt
PS1='[\u@\h \W]\$ '
