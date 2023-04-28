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
jsontools
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
alias nv="nvim"
alias v="nvim ./"

# System aliases
alias cl="clear"
alias e="exit"
alias bat=showFileContent
alias sns="sensors"
alias ht="htop"
alias tu="thunar"
alias xgo="xdg-open"
alias lo="lsof -i -P -n"
alias msqs="sudo service mysql status"
alias cfl="sh ~/cflask/main.sh"
alias ls="logo-ls --git-status"
alias la="logo-ls -a --git-status -o -X --time-style=RFC1123Z"
alias GET=getRequest

# Git aliases
alias ga="git add"
alias gaa="git add -A"
alias gbd="git branch -d"
alias gbl="git branch -l"
alias gbm="git branch -m"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gi="git init"
alias gl="git log"
alias glo="git log --oneline"
alias glp="git log -p"
alias gm="git merge"
alias gp="git push"
alias gpl="git pull"
alias gpom="git push -u origin master"
alias grt="git restore"
alias grao="git remote add origin"
alias grs="git reset"
alias grsuo="git remote set-url origin"
alias grv="git remote -v"
alias gs="git status"
alias gss="git status -s"
alias gu=updateGitRepo

# Functions
function showFileContent() {
	batcat $1 --theme=TwoDark --paging=never
}

function getRequest(){
	curl $1 | json_pp | batcat --language=json --theme=TwoDark --paging=never
}

function updateGitRepo() {
	git fetch
	git pull
}

# Use ctrl for move while words
bindkey "[[1;3C" forward-word
bindkey "[[1;3D" backward-word

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
