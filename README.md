# Dotfiles
Hello! These are my personal dotfiles feel free to pick up what you want.

# Neovim
My neovim setup uses multiple plugins and **packer-nvim** as a plugin manager. It has some dependencies, if you are planning to use it you should install the following:

```bash
# Dependencies
sudo apt install gcc g++ clang npm nodejs lua5.4 python3 -y

# Packer-nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Github Copilot
If you are not planning to use it you can skip this.

On Debian based distros the npm delivered version is 12.x, but it requires 16.x, to fix it I used nvm.

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

Then you will have to add it to the PATH.

**zsh**
```bash
echo '# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> $ZDOTDIR/.zshrc
```

**bash**
```bash
echo '# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm' >> $HOME/.bashrc
```

Eventually install the required npm version.

```
nvm install 16.15.0
```

Now you can safely copy the neovim config.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
cp -r nvim ~/.config/nvim
nvim +PackerSync
```
