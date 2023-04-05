# Dotfiles
Hello! These are my personal dotfiles feel free to pick up what you want.

# Table Of Contents

- [Neovim](#neovim)
  * [Dependencies](#dependencies)
  * [Github Copilot](#github-copilot)
  * [Installation](#installation)
- [Zsh](#zsh)
  * [Fix global dir variables](#fix-global-dir-variables)
  * [Oh-My-Zsh](#oh-my-zsh)
  * [Starship](#starship)
  * [Nerd Font](#nerd-font)
  * [Installation](#installation-1)

# Neovim

## Dependencies

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

Now install the required npm version.

```
nvm install 16.15.0
```

After installing the config you will have to run `:Copilot setup` to link it with your github account.

## Installation

Now you can safely copy the neovim config.

```bash
mv ~/.config/nvim ~/.config/nvim.bak
cp -r nvim ~/.config/nvim
nvim +PackerSync
```

# Zsh

First ensure zsh is installed in your system.

```bash
sudo apt install zsh -y
```

## Fix global dir variables
By default the `.zshrc` file location is at $HOME, but I prefere it to be $HOME/.config/zsh, by this mean and for better sustainability I like to change the default XDG paths.

```bash
sudo mkdir -p /etc/zsh/
sudo echo 'export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export ZDOTDIR=$HOME/.config/zsh' >> /etc/zsh/zshenv
```

Then create the zsh config folder.

```bash
mkdir -p $HOME/.config/zsh
```

## Oh-My-Zsh
For better shell suggestions I use [Oh My Zsh](https://ohmyz.sh/), to install it run:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Accept everything and make zsh your default shell. ( If you missed it you can use `chsh -s /usr/bin/zsh $USER` )

Finally move the folder to our config folder.

```bash
mv ~/.oh-my-zsh $HOME/.config/zsh/oh-my-zsh
```

## Starship
For having a better prompt I use starship, which gives me detailed information about git, language version, etc, in a coloured way. To install it use:

```bash
curl -sS https://starship.rs/install.sh | sh
```

## Nerd Font
Symbols won't render correctly if you don't have installed a nerd font. To install one go to [www.nerdfonts.com](https://www.nerdfonts.com/font-downloads) and download your favourite. I will use as an example Iosevka.

```bash
# Download the font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip

# Extract it
unzip Iosevka.zip -d Iosevka

# Install it
sudo mv Iosevka/ /usr/share/fonts/

# Remove the zip
rm Iosevka.zip
```

## Installation

Finally to copy my configuration you will have to do:

```bash
# If you have followed all the steps
cp zsh/zshrc $HOME/.config/zsh/.zshrc

# If you have fresh installation without any changes (something will fail)
cp zsh/zshrc $HOME/.zshrc
```
