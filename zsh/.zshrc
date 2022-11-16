# Starship
eval "$(starship init zsh)"

# Aliases
alias ls="lsd"
alias nivm="nvim"

# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Open bash in tty
if [ `tput colors` != "256" ]; then
  exec bash -l;
fi
