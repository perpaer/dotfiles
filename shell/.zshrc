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
alias mirrors='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist && eos-rankmirrors --verbose'

# (Neo)Vim
alias v="nvim"
alias vim="nvim"
alias vedit="nvim ~/dotfiles/nvim/.config/nvim/init.vim"

alias i3edit="nvim ~/dotfiles/i3/.i3/config"
alias tns="tmux new -s"
alias dotedit="cd ~/dotfiles && nvim"
alias cat="bat"

# Docker
alias dockup="docker-compose up -d"
alias dockkill="docker-compose kill"

alias rmnode="find . -name "node_modules" -exec rm -rf '{}' + "
alias obs="VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_pro_icd64.json:/usr/share/vulkan/icd.d/amd_pro_icd32.json devour obs"
alias androidstudio="~/.local/share/JetBrains/Toolbox/apps/android-studio/bin/studio.sh"

export PATH=$PATH:$HOME/.volta/bin
export PATH=$PATH:$HOME/.local/bin

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Flutter
export FLUTTER_HOME=$HOME/flutter
export PATH=$PATH:$FLUTTER_HOME/bin

# Deno
export DENO_INSTALL="/home/rejd/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# Vulkan loader
export AMD_VULKAN_ICD=RADV

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# pnpm
export PNPM_HOME="/home/rejd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

source /home/rejd/.config/broot/launcher/bash/br

# bun completions
[ -s "/home/rejd/.bun/_bun" ] && source "/home/rejd/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export BROWSER=brave

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# opencode
export PATH=/home/rejd/.opencode/bin:$PATH
