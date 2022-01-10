source "/usr/local/opt/zsh-git-prompt/zshrc.sh"
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export PS1='[%n@%m %~$(git_super_status) $(kube_ps1)]%# '
HISTTIMEFORMAT='%F %T '
SAVEHIST=5000
HISTSIZE=2000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY

bindkey '^R' history-incremental-search-backward
bindkey '\e#' pound-insert
setopt INTERACTIVE_COMMENTS

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>|'
autoload -U select-word-style
select-word-style bash

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS


alias k=kubectl
alias tf=terraform
alias kimg='kubectl get pods -o custom-columns="NAME:.metadata.name,IMAGE:.spec.containers[0].image"'
alias king='kubectl get ingresses -o custom-columns="NAMESPACE:.metadata.namespace,NAME:.metadata.name,ANNOTATION:.metadata.annotations.nginx\.ingress\.kubernetes\.io/ingress\.class",CLASS:.spec.ingressClassName,LOADBALANCER:.status.loadBalancer.ingress.\*.hostname'
alias kpsp='kubectl get pods -o custom-columns="NAME:.metadata.name,PSP:.metadata.annotations.kubernetes\.io/psp"'
alias kdrain='kubectl drain --delete-emptydir-data --ignore-daemonsets'



export GOPATH=~/src/go
export PATH="${GOPATH}/bin:${PATH}:${HOME}/.krew/bin"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

function vscode {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
