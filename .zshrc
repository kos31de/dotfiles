# ruby
alias bers="bundle exec rails server"
alias be="bundle exec"
alias bi="bundle install"

# envchain
alias ec="envchain"

# anyenv
eval "$(anyenv init -)"

# Go
# eval "$(goenv init -)"
# export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
export PATH=$HOME/.goenv/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# rbenv
# export PATH="$HOME/.rbenv/shims:$PATH"
# export RBENV_ROOT="$HOME/.rbenv"
# eval "$(rbenv init -)"

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# # %~は作業ディレクトリ、%nはユーザー名
# export PS1="%~ %n "

# # プロンプトに時刻を表示
# RPROMPT='%{$fg[green]%} %D{%Y/%m/%d} %* %{$reset_color%}'

# git関係は~/.gitconfig
alias gpoh="git push origin HEAD"
alias gpfoh="git push -f origin HEAD"
alias gd="git diff HEAD^"

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='#%F{green}%n%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '
# setopt PROMPT_SUBST ; PS1='#%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
# \$ '

# nodeenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

# ファジーサーチしてghqで管理しているrepoのdirに移動する peco-code
function peco-code () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="code ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-code
bindkey '^f' peco-code

# ファジーサーチして移動する find_cd
function find_cd() {
    cd "$(find . -type d | peco)"
}
alias fc="find_cd"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

# k8s
source <(kubectl completion zsh)

alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias kg='kubectl get'
alias kd='kubectl delete -f'
alias ka='kubectl apply -f'
alias ke='kubectl explain'

# CKA or CKAD
# 実際の試験と同じエイリアスが動かない
export do='--dry-run=client -o=yaml'
export now='--force --grace-period=0'

# tmux
alias tm="tmux"

# kupe-ps1
# source "/opt/homebrew/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# Terraform
alias tf="terraform"
alias tfp="terraform plan"
alias tfa="terraform apply"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# loco_ec2_seesion
function loco_ec2_ssm() {
    envchain aws-bargain aws ssm start-session --target $(envchain aws-bargain aws ec2 describe-instances --output text --query "Reservations[].Instances[].[InstanceId,Tags[?Key=='Name'].Value|[0]]" | peco | awk '{print $1}')
}

# nvim
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
