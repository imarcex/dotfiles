export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/.local/cargo/bin:$PATH"
# export PATH="$HOME/.local/foundry/bin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"

export SUDO_PROMPT="passwd: "
export VISUAL="nvim"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_RUNTIME_DIRS="/run/usr/$UID"

export GDBHISTFILE="$XDG_CONFIG_HOME/gdb/gdb_history"
export GOPATH="$HOME/.local/go"

export NVM_DIR="$HOME/.local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
