# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ----------------- Typewritten theme -----------------
ZSH_THEME="typewritten/typewritten"

# Config cursor style
TYPEWRITTEN_PROMPT_LAYOUT="pure"
TYPEWRITTEN_ARROW_SYMBOL="➜"

# Config theme colors
TYPEWRITTEN_COLOR_MAPPINGS="primary:#A5ABCB;secondary:#89DDFF;accent:#89DDFF;info_negative:#F07178;info_positive:#C3E88D"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
zsh-autopair
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Alias
# NeoVim Aliases
alias v="nvim"

# System aliases
alias updt="sudo apt update && sudo apt upgrade -y"
alias clean=cleanAPT
alias cl="clear"
alias e="exit"
alias bat=showFileContent
alias version="lsb_release -a"
alias zup="source ~/.zshrc"
alias zrc=updateZsh
alias vrc=updateNvim
alias ls="exa --icons --color=always --group-directories-first"
alias la="exa -a -l -G --git --icons --color=always --group-directories-first"
alias tree=treeExa

# Git aliases
alias gaa="git add -A"
alias gbm="git branch -M main"
alias gcm="git commit -m"
alias gd="git diff"
alias gds="git diff --staged"
alias gi="git init"
alias gp="git push"
alias gpom="git push -u origin master"
alias grao="git remote add origin"
alias gs="git status"
alias gss="git status -s"

# Functions
function showFileContent() {
	batcat $1 --theme=TwoDark --paging=never
}

function treeExa() {
	exa --tree --level=2 $1
}

# Update nvim rc
function updateNvim() {
	cd ~/.config/nvim
	nvim init.vim
}

# Update zsh rc
function updateZsh() {
	cd ~
	nvim .zshrc
}

function cleanAPT() {
	sudo apt autoclean
	sudo apt clean
	sudo apt autoremove -y
}

# Use ctrl for move while words
bindkey "[[1;3C" forward-word
bindkey "[[1;3D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
