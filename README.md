# Linux Setup

Author: Erick Avila | @ErickAvilaB


## Distribution

I use Debian 12. [Visit the official web site](https://www.debian.org/index.es.html)


## Create workspace folder

```bash
cd
mkdir workspace
```


## Update linux

```bash
sudo apt update && sudo apt upgrade -y
```


## Install Web Browser

For chrome installation we need to go to [chrome official web site](https://www.google.com/intl/es-419/chrome/), then download the .deb. Open a terminal in the download directory and run.

```bash
sudo apt install -y ./<package>
```


## Install Git

Install git with:

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt-get install -y git
```


### Git config

Config the global git options.

```bash
git config --global user.name "ErickAvilaB"           # Set the GitHub user
git config --global user.email "yahir7083@gmail.com"  # Set the email
git config --global init.defaultBranch main           # Set the initial branch name
```


## SSH

Create an ssh key and add it to GitHub.

```bash
cd
mkdir .ssh
cd .ssh
ssh-keygen -t ed25519 -C "DebianPC"

# Add public key to GitHub (file ends .pub)

# Add ssh key to device
ssh-add ~/.ssh/<key>
```

Then create the ssh configuration `~/.ssh/config` file with the next content.

```bash
Host *
  AddKeysToAgent yes
  IdentityFile ~/.ssh/DebianPC
```


## Install ZSH and ho my zsh

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

Download:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### Syntax

Download:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### Typewritten

Download:

```bash
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
ln -s "$ZSH_CUSTOM/themes/typewritten/async.zsh" "$ZSH_CUSTOM/themes/async"
```

### Configuration

Use the repo

```bash
git clone https://github.com/ErickAvilaB/dotfiles.git

rm -f .zshrc

ln -s ~/dotfiles/.zshrc ~/.zshrc
```


## Install Nerd Font

Download form [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

```bash
# In zip file directory
unzip <package> -d <package>
sudo mv <package> /usr/share/fonts/
fc-cache
```


## Neovim

### Installation
<!-- TODO: update installation -->
```bash
# Install from snap
sudo apt-get install neovim
```

### Dependencies

- C compiler
```
sudo apt install -y build-essential
```

- Telescope
```bash
# Grep
sudo apt install -y ripgrep
```

- Copilot
Run `:Copilot setup`, login on GitHub and paste the code.

#### Python

```bash
# Install pynvim
sudo apt-get install python3-neovim
```

#### Node

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
<!-- TODO: update configuration -->
Clone my config repo and set up nvim:

```bash
cd
cd .config/
git clone git@github.com:ErickAvilaB/nvim.git
cd nvim
mkdir plugged
```


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


## EXA

```bash
sudo apt install -y exa
```


## Shortcuts
<!-- TODO: add shortcuts -->

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


## Final look
<!-- TODO: update final look -->
![Desktop](https://github.com/ErickAvilaB/linux-setup/blob/master/assets/img/Screenshot_2023-04-28_13-27-36.png)


(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧

