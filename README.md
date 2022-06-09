# Linux Setup :
Author: Erick Avila | @ErickAvilaB
***

## Table of Contents
***

<a name="distribution"></a>
## Distribution
Xubuntu is an Ubuntu flavour. Download the **Supported LTS release: 20.04, Focal Fossa** ISO from the [official page](https://xubuntu.org/download/).
***

<a name="hour"></a>
## Hour
Dual boot with Window and Linux has problem with the hour, to solve that first **set right hour in window** the run:
~~~
$ timedatectl set-local-rtc 1 --adjust-system-clock
~~~
***

## Create workspace folder
~~~
$ cd
$ mkdir workspace
~~~

<a name="update"></a>
## Update and Upgrade
`$ sudo apt update && sudo apt upgrade`
***

<a name="chrome"></a>
## Install Chrome
For chrome installation we need go to [official chrome web site](https://www.google.com/intl/es-419/chrome/), then download the .deb. Open a terminal in the download directory, run the command `$ sudo dpkg -i <package name>`.
***

<a name="git"></a>
## Install git
[Guide](https://git-scm.com/download/linux)  
Install git with: `$ sudo apt-get install git`.
***

<a name="git-config"></a>
## Git config
[Guide](https://git-scm.com/book/es/v2/Inicio---Sobre-el-Control-de-Versiones-Configurando-Git-por-primera-vez)  
Git generate a file config where is located all user and global settings, to access that file run at terminal `$ git config --global -e`. There copy the next content:
~~~
# This is Git's per-user configuration file.
[user]
	name  = Erick Avila
	email  = yahir7083@gmail.com
# Please adapt and uncomment the following lines:
# name = erick
# email = erick@erick.(none)
[core]
	editor  = nvim
	autocrlf = input
[color]
	ui  = true
[help]
	autocorrect  = 1
[init]
	defaultBranch = main
~~~
***

<a name="ssh"></a>
## SSH
[Guide](https://git-scm.com/book/es/v2/Git-en-el-Servidor-Generando-tu-clave-p%C3%BAblica-SSH)
Create an ssh key and add it to GitHub.
~~~
$ cd
$ mkdir .ssh
$ cd .ssh
$ ssh-keygen

# Add public key to GitHub(file ends .pub)

$ ssh-add ~/ssh/<name private key>
~~~

<a name="zsh"></a>
## Install ZSH and ho my zsh
[Zsh guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) | [Ho my zsh guide](https://ohmyz.sh/)  
~~~
# Install zsh
$ sudo apt install zsh

# Init zsh, then press 0 and exit
$ zsh

# Make zsh the default shell. Restart.
$ chsh -s $(which zsh)

# After restart install ho my zsh
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
~~~

<a name="zsh-plugins"></a>
### Install zsh plugins
Some plugins for improve zsh experience.

#### Autosuggestion
[Guide](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)  
Download:
~~~
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~~~
Add to .zshrc:
~~~
plugins=(
	zsh-autosuggestions
)
~~~

#### Syntax
[Guide](https://linuxhint.com/enable-syntax-highlighting-zsh/)  
Download:
~~~
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
~~~
Add to .zshrc:
~~~
plugins=(
	zsh-syntax-highlighting
)
~~~

#### Autopair
[Guide](https://github.com/hlissner/zsh-autopair)
Download:
~~~
$ git clone https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
~~~
Add to .zshrc
~~~
plugins=(
	zsh-autopair
)
~~~

#### Typewritten
[Guide](https://typewritten.dev/#/)  
Download:
~~~
$ git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
~~~
Make symlink:
~~~
$ ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"

$ ln -s "$ZSH_CUSTOM/themes/typewritten/async.zsh" "$ZSH_CUSTOM/themes/async"
~~~
Add theme to .zshrc:
~~~
# Use theme
ZSH_THEME="typewritten/typewritten"

# Config cursor style
TYPEWRITTEN_PROMPT_LAYOUT="pure"

# Config theme colors
TYPEWRITTEN_COLOR_MAPPINGS="primary:#A5ABCB;secondary:#B888DA;accent:#B888DA;info_negative:#F07178;info_positive:#A4C37D"
~~~

### JSON tools
[Guide](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools)
Download:
~~~
$ git clone https://github.com/ErickAvilaB/zsh-json.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-json
~~~
Add to .zshrc
~~~
plugins=(
	jsontools
)
~~~

### CFLASK
Download:
~~~
$ git clone https://github.com/ErickAvilaB/cflask.git ~/workspace
~~~
Then create alias to main.sh(~/workspace/cflask/main.sh) on .zshrc

<a name="zsh-config"></a>
### ZSH config
[File](./assets/.zshrc)
~~~
# Alias
# NeoVim Aliases
alias nv="nvim"
alias v="nvim ./"

# System aliases
alias cl="clear"
alias e="exit"
alias bat="batcat"
alias tm="tmux"
alias sns="sensors"
alias ht="htop"
alias tu="thunar"
alias xgo="xdg-open"
alias lo="lsof -i -P -n"

# Git aliases
alias gi="git init"
alias gs="git status"
alias gss="git status -s"
alias ga="git add"
alias gaa="git add -A"
alias gc="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gbd="git branch -d"
alias gbm="git branch -m"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log"
alias glo="git log --oneline"
alias grao="git remote add origin"
alias gpom="git push -u origin master"
alias gp="git push"
alias gf="git fetch"
alias gpl="git pull"
alias gu=updateGitRepo

function updateGitRepo() {
	git fetch
	git pull
}

# Use ctrl for move while words
bindkey "[[1;3C" forward-word
bindkey "[[1;3D" backward-word
~~~
***

<a name="alacritty"></a>
## Alacritty terminal
Install with the next [video](https://www.youtube.com/watch?v=9ttxDIolNBo)

### Install Nerd Font
[Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip)  
Install:
~~~
# In zip file directory
$ unzip <package name>
$ sudo mv * /usr/share/fonts/
~~~

Config:
~~~
# Crate config directory
$ cd .config
$ mkdir alacritty
$ nano alacritty.yml

# In alacritty.yml copy:

# Window config
window:
  dimensions:
    columns: 125
    lines: 40
  opacity: 1.0
  dynamic_title: false

# Font config
font:
  size: 9.0
  normal:
    family: JetBrainsMono Nerd Font
    style: Medium
  bold:
    family: JetBrainsMono Nerd Font
    style: Bold
  italic:
    family: JetBrainsMono Nerd Font
    style: Medium Italic
  bold_italic:
    family: JetBrainsMono Nerd Font
    style: Bold Italic

# Colors. Theme Palenight
colors:
  # Default colors
  primary:
    background: '0x292d3e'
    foreground: '0xd0d0d0'

  # Normal colors
  normal:
    black:   '0x292d3e'
    red:     '0xf07178'
    green:   '0xc3e88d'
    yellow:  '0xffcb6b'
    blue:    '0x82aaff'
    magenta: '0xc792ea'
    cyan:    '0x89ddff'
    white:   '0xd0d0d0'

  # Bright colors
  bright:
    black:   '0x434758'
    red:     '0xff8b92'
    green:   '0xddffa7'
    yellow:  '0xffe585'
    blue:    '0x9cc4ff'
    magenta: '0xe1acff'
    cyan:    '0xa3f7ff'
    white:   '0xffffff'
~~~
***

<a name="nvim"></a>
## Install NeoVim
[Guide](https://github.com/neovim/neovim/wiki/Installing-Neovim)  
~~~
$ sudo add-apt-repository ppa:neovim-ppa/stable
$ sudo apt-get update
$ sudo apt-get install neovim
~~~
***

### Install vim plug
[Guide](https://github.com/junegunn/vim-plug)  
~~~
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
~~~

### Connect python and node with nvim

#### Python
[Guide](https://github.com/neovim/pynvim)  
~~~
# Install pip
$ sudo apt-get install python3-pip

# Install pynvim
$ pip3 install pynvim
$ pip3 install --upgrade pynvim
~~~

### Node
[Guide](https://github.com/nvm-sh/nvm) | [NPM Neovim](https://www.npmjs.com/package/neovim/v/0.0.1)
~~~
# Install node through nvm
# Install nvm
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Update zsh
$ source ~/.zshrc

# Install node
$ nvm install --lts

# Install node neovim
$ npm install -g neovim
~~~

### Config nvim
[Guide](https://github.com/ErickAvilaB/nvim)
~~~
$ cd
$ cd .config/
$ git clone git@github.com:ErickAvilaB/nvim.git
$ cd nvim
$ mkdir plugged
~~~

After open plugins.vim and run `:PlugInstall`

#### Dependencies
[COC](https://github.com/neoclide/coc.nvim) | [PEP8](https://pypi.org/project/autopep8/) | [FZF](https://github.com/junegunn/fzf.vim) | [Copilot](https://github.com/github/copilot.vim) | [Prettier](https://github.com/prettier/vim-prettier)  
- COC
~~~
:CocInstall coc-pyright
:CocInstall coc-html
:CocInstall coc-css
:CocInstall coc-tsserver
~~~

- PEP8
~~~
$ pip install --upgrade autopep8
~~~

- FZF
~~~
# Install bat
$ sudo apt install bat

# AG
$ sudo apt-get install silversearcher-ag
~~~

- Copilot  
Run `:Copilot setup`, login on GitHub and paste the code.

- Prettier
~~~
$ cd .config/nvim/plugged/vim-prettier
$ npm install
~~~
***

<a name="Customization"></a>
## Customization
### Themes
For install themes first we need to create two folders in /home/<user>/ directory, the first will be called **.icons** and the second **.themes**
~~~
$ cd
$ mkdir .icons
$ mkdir .themes
~~~

#### Icon theme Kora

Go to this [site](https://www.xfce-look.org/p/1256209) and download the theme called **kora-1-5-2zip**. Then run the commands:
~~~
$ sudo mv Downloads/<package name> ~/.icons
$ cd .icons
$ tar -xvf <package name>
$ gtk-update-icon-cache /home/<user>/.icons/<package name>
$ sudo rm <package name>
~~~

Now Settings > Appearance > Icons; and select **Kora**  
![Config](./assets/4.png)

### Windows theme Nordic
Go to this [site](https://www.xfce-look.org/p/1253385) and download the theme called **Sweet-Dark.tarxz**. Then run the commands:
~~~
$ sudo mv Downloads/<package name> ~/.themes
$ cd .themes
$ tar -xvf <package name>
$ sudo rm <package name .tar>
~~~

Settings > Appearance > Style; and select **Sweet-Dark**
Settings > Appearance > window manager; and select **Sweet-Dark**

1  
![Style](./assets/5.png)

2  
![Window](./assets/6.png)

### Change font
[Download font](https://www.dafontfree.io/download/san-francisco-text/?wpdmdl=64309&refresh=62615668b4aad1650546280&ind=1601919915418&filename=1601919916wpdm_San-Francisco.zip)
~~~
$ unzip San-Francisco.zip
$ cd San Francisco/SFUIDisplay/
$ sudo mv . /usr/share/fonts
~~~

### Desktop
![Wallpaper](./assets/auto-en-carretera-con-el-cielo-nocturno-arte-digital_1920x1080_xtrafondos.com.jpg)
![Config](./assets/8.png)

Disable desktop icons. Settings > Desktop > Icons > Appearance > Icon type: None  

### Cursor
Go to this [site](https://www.xfce-look.org/p/1356095) and download the theme called **volantes_cursors.targz**. Then run the commands:
~~~
$ sudo mv Downloads/<package name> ~/.icons
$ cd .icons
$ tar -xvf <package name>
$ sudo rm <package name .tar>
~~~
Settings > Mouse > Theme; and select **Sweet**  
![Sweet cursor](./assets/17.png)

## Panel
![Config](./assets/9.png)
![Config](./assets/10.png)
![Config](./assets/11.png)
![Config](./assets/12.png)
![Panel button](./assets/13.png)

<a name="Plank"></a>
## Plank
~~~
$ sudo apt install plank
~~~
Add to startup. Go to Settings > Session and Start Up > Applications > Add; fill whit plank.
![Config](./assets/sas.png)
![Config](./assets/14.png)
![Config](./assets/15.png)

<a name="Ulauncher"></a>
## Ulauncher
[Guide](https://ulauncher.io/#)
~~~
$ sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher
~~~
![Config](./assets/16.png)

### Install theme for Ulauncher
[Install Zorin theme](https://github.com/NayamAmarshe/ulauncher-zorinBlueDark)

<a name="extra"></a>
## Some extra things
~~~
# Install stacer
$ sudo apt install stacer

# Install flask
$ pip install Flask

# Install venv
$ pip install virtualenv
$ sudo apt install python3.8-venv

# Install live server
$ npm install -g live-server

# Install neofetch
$ sudo apt install neofetch

# Install htop
$ sudo apt install htop

# Install markserv
$ npm i -g markserv

# Install peek
$ sudo add-apt-repository ppa:peek-developers/stable
$ sudo apt update
$ sudo apt install peek
~~~

(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
