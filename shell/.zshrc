export ZSH="$HOME/.oh-my-zsh"
plugins=(git npm tmux zsh-autosuggestions)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.fzf.zsh"

fpath+=("$HOME/.zsh/pure")

autoload -U promptinit; promptinit
prompt pure

eval "$(rbenv init -)"

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
alias rmnode="find . -name \"node_modules\" -exec rm -rf '{}' + "
