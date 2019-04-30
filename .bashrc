#
# File:       .bashrc (https://github.com/wasabi315/dotfiles)
# Maintainer: wasabi315
# License:    MIT
#


# System default ---------------------------------------------------------

export PLATFORM=$(uname -s)
[ -f /etc/bashrc ] && . /etc/bashrc

# Options ----------------------------------------------------------------

shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Environment variables --------------------------------------------------

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:c:history'
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
[ -z "$TMPDIR" ] && TMPDIR=/tmp

export EDITOR='nvim'
export TERM='xterm-256color'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Aliases ----------------------------------------------------------------

alias ls='ls --color=auto'
alias vdir='vdir --color=auto'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias c='clear'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd=cdls

function cdls() {
    \cd $1
    ls
}

alias vi='nvim'

alias mk='touch'
alias mkdir='mkdir -p -v'

alias svi='sudo vi'
alias root='sudo su'

alias ghci=ghciClear

function ghciClear() {
    stack ghci
    \clear
}

# Prompt -----------------------------------------------------------------

color_prompt=yes

source ~/.git-prompt.sh

if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-completion.bash

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM=1

    PS1='\[\e[1;34m\][ \w\[\e[1;33m\]$(__git_ps1)\[\e[m\]\[\e[1;34m\] ]\[\e[m\]\n\[\e[1;32m\]\A\[\e[m\] \$ '
else
    PS1='\[\e[1;34m\][ \w ]\[\e[m\]\n\[\e[1;32m\]\A\[\e[m\] \$ '
fi

# Completion -------------------------------------------------------------

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

eval "$(stack --bash-completion-script stack)"

# Autostart tmux ---------------------------------------------------------

# if [[ -z "$TMUX" ]]; then
#     ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"
#     if [[ -z "$ID" ]]; then
#         tmux new-session
#     else
#         tmux attach-session -t "$ID"
#     fi
# fi

# FZF commands -----------------------------------------------------------

fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

fga() {
    modefied=$(git status --short | awk '{print $2}') &&
    seleceted=$(echo "$modefied" | fzf -m --preview 'git diff {}') &&
    git add $selected
}

fbr() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

