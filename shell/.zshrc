export ZSH=$HOME/.oh-my-zsh
plugins=(git npm tmux zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/.fzf.zsh

fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

# Git
alias giting="git fetch && git pull"
alias gaa="git add ."
alias gc="git commit"
alias gp="git push"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

alias dev="cd $HOME/projects/"
alias apdejt="eos-update && yay -Syu"
alias mirrors='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist && eos-rankmirrors --verbose'
alias v="nvim"
alias tns="tmux new -s"
alias cat="bat"
alias obs="VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_pro_icd64.json:/usr/share/vulkan/icd.d/amd_pro_icd32.json devour obs"
alias androidstudio="~/.local/share/JetBrains/Toolbox/apps/android-studio/bin/studio.sh"
alias rmnode="find . -name "node_modules" -exec rm -rf '{}' + "

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_AVD_HOME=$HOME/.config/.android/avd
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket

# pnpm
export PNPM_HOME="/home/rejd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.local/bin:$PATH"
