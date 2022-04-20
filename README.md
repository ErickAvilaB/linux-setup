# Linux Setup
Author: Erick Avila | @ErickAvilaB on GitHub
***

## Table of Contents
1. [Distribution](#distribution)
2. [Initial settings](#initial-settings)
	* [WiFi](#wifi)
	* [Hour](#hour)
3. [Update and Upgrade](#update)
4. [Install Chrome](#chrome)
5. [Install Git](#git)
	* [Git config](#git-config)
	* [SSH key](#ssh)
6. [Install zsh](#zsh)
	* [ZSH plugins](#zsh-plugins)
	* [ZSH config](#zsh-config)
7. [Xfece terminal](#xfce-terminal)
8. [Install tmux](#tmux)
9. [Install NeoVim](#nvim)
***

<a name="distribution"></a>
## Distribution
I use Linux lite, it's a Ubuntu's child. Download ISO from the [official page](https://www.linuxliteos.com/download.php) and boot with [Rufus](https://rufus.ie/es/).
***

<a name="initial-settings"></a>
## Initial settings

<a name="wifi"></a>
### WiFi
[Guide](https://askubuntu.com/questions/1030653/wifi-randomly-disconnected-on-ubuntu-18-04-lts)  
I've got problems with WiFi, it randomly shutdown and it's necessary restart the PC to get WiFi back.
For solve it run at terminal:
~~~
$ sudo nano /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
~~~
And change `wifi.powersave = 3` to `wifi.powersave = 2`.

<a name="hour"></a>
### Hour
I've got problems whit hour too, it mistakenly change.Run the next command at terminal to solve it:
~~~
$ timedatectl set-local-rtc 1 --adjust-system-clock
~~~
***

<a name="update"></a>
## Update and Upgrade
Here we are going to update and upgrade. Just run the follow command:`$ sudo apt update && sudo apt upgrade`
***

<a name="chrome"></a>
## Install Chrome
For chrome installation we need go to [official chrome web site](https://www.google.com/intl/es-419/chrome/), then download the .deb. Open a terminal in the download directory, run the command `$ sudo dpkg -i <package name>`.
***

<a name="git"></a>
## Install git
[Guide](https://git-scm.com/download/linux)  
Git is a fundamental tool for development, so let's install it: `$ sudo apt-get install git`.
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

# Add public key to GitHub

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
TYPEWRITTEN_COLOR_MAPPINGS="primary:#A1A7B4;secondary:#BB77D9;accent:#BB77D9;info_negative:#D96C80;info_positive:#98C379"
~~~

<a name="zsh-config"></a>
### ZSH config
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

<a name="xfce-terminal"></a>
## Xfce terminal
Just copy the next settings:

### 0 Install Nerd Font
[Download](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip)  
Install:
~~~
$ unzip <package name>
$ sudo mv *.ttf /usr/share/fonts/
~~~

### 1
![1](./assets/1.png)

### 2
![2](./assets/2.png)

### 3
![3](./assets/3.png)
- Text color: #A1A7B4  
- Background: #282C34  
- Cursor: #BB77D9  
- Selection: #BB77D9  
- Bold: #98C379
***

<a name="tmux"></a>
## Install tmux
[Ho my tmux](https://github.com/gpakosz/.tmux)  
~~~
# Install tmux
$ sudo apt install tmux

# Install ho my tmux
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
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
Create a directory named **nvim** in **~/.cofig**, then create an directory named **plugged** there will save the plugins.
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
$ nvm install node

# Install node neovim
$ npm install -g neovim
~~~

### Config nvim
[Guide](https://github.com/ErickAvilaB/nvim)
~~~
$ cd
$ cd .config/
$ git clone https://github.com/ErickAvilaB/nvim.git
$ cd nvim
$ mkdir plugged
~~~

After open plugins.vim and run `:PlugInstall`

#### Dependencies
[COC](https://github.com/neoclide/coc.nvim) | [PEP8](https://pypi.org/project/autopep8/) | [FZF](https://github.com/junegunn/fzf.vim) | [Copilot](https://github.com/github/copilot.vim)  
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