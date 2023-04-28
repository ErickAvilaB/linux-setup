# Linux Setup
Author: Erick Avila | @ErickAvilaB
***

## Distribution
Xubuntu is an Ubuntu flavour which uses xfce as graphic environment. Download the **Supported LTS release: 20.04, Focal Fossa** ISO from the [official page](https://xubuntu.org/release/20-04/).
***

## Hour
Dual boot systems gets problems setting the right time, to solve it run in terminal:
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```
***

## Create workspace folder
```bash
cd
mkdir workspace
```
***

## Update linux
```bash
sudo apt update && sudo apt upgrade
```
***

## Install Web Browser
For chrome installation we need to go to [chrome official web site](https://www.google.com/intl/es-419/chrome/), then download the .deb. Open a terminal in the download directory and run.
```bash
sudo dpkg -i <package>
```
***

## Install Git
[Guide](https://git-scm.com/download/linux)  
Install git with:
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install git
```

### Git config
[Guide](https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Configurando-Git-por-primera-vez)  
Git generate a file config where is located the user settings, to access that file run in terminal.
```bash
git config --global -e
```
There paste the next content:
```bash
# This is Git's per-user configuration file.
[user]
	name  = Erick Avila
	email  = yahir7083@gmail.com
[core]
	editor  = nvim
	autocrlf = input
[color]
	ui  = true
[help]
	autocorrect  = 1
[init]
	defaultBranch = main
```
***

## SSH
[Guide](https://git-scm.com/book/es/v2/Git-en-el-Servidor-Generando-tu-clave-p%C3%BAblica-SSH)  
Create an ssh key and add it to GitHub.
```bash
cd
mkdir .ssh
cd .ssh
ssh-keygen
ssh-add ~/ssh/<name private key>

# Add public key to GitHub (file ends .pub)
```
***

## Install ZSH and ho my zsh
[Zsh guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) | [Ho my zsh guide](https://ohmyz.sh/#install)

```bash
# Install zsh
sudo apt install zsh

# Init zsh, then press 0 and exit
zsh

# Make zsh the default shell. Restart.
chsh -s $(which zsh)

# Install curl
sudo apt install curl

# After restart install ho my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### ZSH plugins
#### Autosuggestion
[Guide](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)  
Download:
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Syntax
[Guide](https://linuxhint.com/enable-syntax-highlighting-zsh/)  
Download:
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### Autopair
[Guide](https://github.com/hlissner/zsh-autopair)
Download:
```bash
git clone https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
```

#### JSON tools
[Guide](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools)
Download:
```bash
git clone https://github.com/ErickAvilaB/zsh-json.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-json
```

#### Typewritten
[Guide](https://typewritten.dev/#/)  
Download:
```bash
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
```

#### CFLASK
Download:
```bash
# Install flask
pip install Flask

cd
git clone https://github.com/ErickAvilaB/cflask.git
```

### Configuration
File configuration: [**zsh.rc**](https://github.com/ErickAvilaB/linux-setup/blob/master/assets/config-files/.zshrc)
***

## Alacritty terminal
### Installation
[Guide](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#prerequisites)
```bash
# Clone the source code
cd
git clone https://github.com/alacritty/alacritty.git

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Set Rust compiler
rustup override set stable
rustup update stable

# Install dependencies
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Compile the project
cd alacritty
cargo build --release

# Termninfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
infocmp alacritty

# Create desktop shortcuts
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Install manual
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# Create config file
cd
touch .config/alacritty/alacritty.yml
```

### Configuration
Configuration file: [**alacritty.yml**](https://github.com/ErickAvilaB/linux-setup/blob/master/assets/config-files/alacritty.yml)

### Install Nerd Font
[Download JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)  
```bash
# Create directory to unzip
mkdir JetBrainsMono
mv <package> JetBrainsMono
cd JetBrainsMono

# In zip file directory
unzip <package name>
sudo mv * /usr/share/fonts/
```
***

## Neovim
### Installation
[Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim#snap)  
```bash
# Install from snap
sudo snap install nvim --classic
```

### Install vim plug
[Guide](https://github.com/junegunn/vim-plug)  
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Nvim compatibility

#### Python
[Guide](https://github.com/neovim/pynvim)  
```bash
# Install pip
sudo apt-get install python3-pip

# Install pynvim
pip3 install pynvim
pip3 install --upgrade pynvim
```

#### Node
[Guide](https://github.com/nvm-sh/nvm) | [NPM Neovim](https://www.npmjs.com/package/neovim/v/0.0.1)
```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Update zsh
source ~/.zshrc

# Install node
nvm install --lts

# Install node neovim
npm install -g neovim
```

### Clipboard
```bash
# Install xclip
sudo apt-get install xclip
```

### Configuration
[Guide](https://github.com/ErickAvilaB/nvim)  
Clone my config repo and set up nvim:
```bash
cd
cd .config/
git clone git@github.com:ErickAvilaB/nvim.git
cd nvim
mkdir plugged
```

Then open plugins.vim and run:
```vim
:PlugUpgrade
:PlugInstall
:PlugUpdate
```

#### Dependencies
[COC](https://github.com/neoclide/coc.nvim) | [PEP8](https://pypi.org/project/autopep8/) | [FZF](https://github.com/junegunn/fzf.vim) | [Copilot](https://github.com/github/copilot.vim) | [Prettier](https://github.com/prettier/vim-prettier)

- COC
```bash
:CocInstall coc-pyright
:CocInstall coc-html
:CocInstall coc-css
:CocInstall coc-tsserver
```

- PEP8
```bash
pip install --upgrade autopep8
```

- Pylint
```bash
pip install pylint
```

- Prettier
```bash
cd .config/nvim/plugged/vim-prettier
npm install
```

- Markserv
```bash
npm i -g markserv
```

- Live Server
```bash
npm install -g live-server
```

- FZF
```bash
# Install bat
sudo apt install bat

# AG
sudo apt-get install silversearcher-ag
```

- Copilot  
Run `:Copilot setup`, login on GitHub and paste the code.
***

## Customization
### Themes
For install themes first we need to create two folders in /home/<user>/directory, the first one will be called **.icons** and the second one **.themes**
```bash
cd
mkdir .icons
mkdir .themes
```

### Icon theme

Go to this [site](https://www.xfce-look.org/p/1340791) and download the theme called **Reversal-blue.tar.xz**. Then run the commands:
```bash
sudo mv Downloads/<package name> ~/.icons
cd .icons
tar -xvf <package name>
gtk-update-icon-cache /home/<user>/.icons/<package name>
sudo rm <package name>
```

### Windows theme
Go to this [site](https://www.gnome-look.org/p/1253385/) and download the theme called **Sweet-Dark.tar.xz**. Then run the commands:
```bash
sudo mv Downloads/<package name> ~/.themes
cd .themes
tar -xvf <package name>
sudo rm <package name .tar>
```

### Font
[Download font](https://www.dafontfree.io/download/san-francisco-text/?wpdmdl=64309&refresh=62615668b4aad1650546280&ind=1601919915418&filename=1601919916wpdm_San-Francisco.zip)
```bash
unzip San-Francisco.zip
cd San Francisco/SFUIDisplay/
sudo mv * /usr/share/fonts
```

### Cursor
Go to this [site](https://www.xfce-look.org/p/1356095) and download the theme called **volantes_cursors.targz**. Then run the commands:
```bash
sudo mv Downloads/<package name> ~/.icons
cd .icons
tar -xvf <package name>
sudo rm <package name .tar>
```
***

## Plank
```bash
sudo apt install plank
```
Add to startup. Go to Settings > Session and Start Up > Applications > Add; fill whit plank.
***

## Ulauncher
[Guide](https://ulauncher.io/#)
```bash
sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher
```

### Install theme for Ulauncher
[Install Zorin theme](https://github.com/NayamAmarshe/ulauncher-zorinBlueDark)
Downloads with:
```bash
git clone https://github.com/NayamAmarshe/ulauncher-zorinBlueDark/ \
  ~/.config/ulauncher/user-themes/zorin-blue-dark

# Then select the theme into config panel.
```
***

## Shortcuts
- Super + M | alacritty --command htop
***

## Some extra things
```bash
# Install stacer
sudo apt install stacer

# Install venv
pip install virtualenv
sudo apt install python3.8-venv

# Install neofetch
sudo apt install neofetch

# Install htop
sudo apt install htop

# Install okular
sudo snap install okular
```
***

## Final look
![Desktop](https://github.com/ErickAvilaB/linux-setup/blob/master/assets/img/Screenshot_2023-04-28_13-27-36.png)

(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
