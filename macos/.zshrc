# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(git npm tmux zsh-autosuggestions)

# Theme
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

source $ZSH/oh-my-zsh.sh
source $HOME/.fzf.zsh

# Git
alias giting="git fetch && git pull"
alias gaa="git add ."
alias gc="git commit"
alias gp="git push"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias dev="cd $HOME/projects/"
alias apdejt="eos-update && yay -Syu"

# (Neo)Vim
alias v="nvim"
alias vim="nvim"
alias vedit="nvim ~/dotfiles/nvim/.config/nvim/init.vim"

alias tns="tmux new -s"
alias dotedit="cd ~/dotfiles && nvim"
# alias cat="bat"

# Docker
alias dockup="docker-compose up -d"
alias dockkill="docker-compose kill"
alias rmnode="find . -name "node_modules" -exec rm -rf '{}' + "

export PATH=$PATH:$HOME/.volta/bin
export PATH=$PATH:$HOME/.local/bin

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter
export FLUTTER_HOME=$HOME/flutter
export PATH=$PATH:$FLUTTER_HOME/bin

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Rust
export PATH=$PATH:$HOME/.cargo/bin

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export BROWSER=brave

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
