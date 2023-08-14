# Linux Setup
Author: Erick Avila | @ErickAvilaB
***

## Distribution
I use Debian 12. [Download](https://www.debian.org/index.es.html)
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
sudo apt update && sudo apt upgrade -y
```
***

## Install Web Browser
For chrome installation we need to go to [chrome official web site](https://www.google.com/intl/es-419/chrome/), then download the .deb. Open a terminal in the download directory and run.
```bash
sudo apt install -y ./<package>
```
***

## Install Git
[Guide](https://git-scm.com/download/linux)  
Install git with:
```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install -y git
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
[Guide](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)  
Create an ssh key and add it to GitHub.
```bash
cd
mkdir .ssh
cd .ssh
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add public key to GitHub (file ends .pub)

# Add ssh key to device
ssh-add ~/.ssh/<key>
```
***

## Install ZSH and ho my zsh
[Zsh guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) | [Ho my zsh guide](https://ohmyz.sh/#install)

```bash
# Install zsh
sudo apt install -y zsh

# Init zsh, then press 0 and exit
zsh

# Make zsh the default shell. Restart.
chsh -s $(which zsh)

# Install curl
sudo apt install -y curl

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

#### Typewritten
[Guide](https://typewritten.dev/#/)  
Download:
```bash
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
```

### Configuration
File configuration: [**zsh.rc**](https://github.com/ErickAvilaB/linux-setup/blob/master/assets/config-files/.zshrc)
***

## Alacritty terminal
### Installation
[Guide](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#prerequisites)

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
sudo apt-get install neovim
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
# Install pynvim
sudo apt-get install python3-neovim
```

#### Node
[Guide](https://github.com/nvm-sh/nvm) | [NPM Neovim](https://www.npmjs.com/package/neovim/v/0.0.1)
```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# Update zsh
source ~/.zshrc

# Install node
nvm install --lts

# Install node neovim
npm install -g neovim
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
[COC](https://github.com/neoclide/coc.nvim) | [PEP8](https://pypi.org/project/autopep8/) | [Copilot](https://github.com/github/copilot.vim) | [Prettier](https://github.com/prettier/vim-prettier)

- COC
```bash
:CocInstall coc-pyright
:CocInstall coc-html
:CocInstall coc-css
:CocInstall coc-tsserver
:CocInstall coc-json
```

- PEP8
```bash
sudo apt-get install python3-autopep8
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

- Telescope
```bash
# Grep
sudo apt install -y ripgrep
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
[Theme](https://www.gnome-look.org/p/1256209)

### Windows theme
[Theme](https://www.gnome-look.org/p/1619506/)

### Cursor
[Theme](https://www.gnome-look.org/p/1411743/)

Unzip themes with `tar -xvf <>`, the move to themes folder.

### Font
[Download font](https://www.dafontfree.io/download/san-francisco-text/?wpdmdl=64309&refresh=62615668b4aad1650546280&ind=1601919915418&filename=1601919916wpdm_San-Francisco.zip)
```bash
unzip San-Francisco.zip
cd San Francisco/SFUIText/
sudo mv * /usr/share/fonts
```
***

## Plank
```bash
sudo apt install -y plank
```
Add to startup. Go to Settings > Session and Start Up > Applications > Add; fill whit plank.
***

## Ulauncher
[Guide](https://ulauncher.io/#)
```bash
sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install -y ulauncher
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

## EXA
[Guide](https://the.exa.website/install/source)
```bash
git clone https://github.com/ogham/exa.git
cd exa
cargo build --release
sudo cp target/release/exa /usr/local/bin
```
***

## Shortcuts
- Super + M | alacritty --command htop
***

## Some extra things
```bash
# Install venv
sudo apt install python3-venv

# Install neofetch
sudo apt install -y neofetch

# Install htop
sudo apt install -y htop

# Install bat
sudo apt install -y bat
```
***

## Final look
![Desktop](https://github.com/ErickAvilaB/linux-setup/blob/master/assets/img/Screenshot_2023-04-28_13-27-36.png)

(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧
