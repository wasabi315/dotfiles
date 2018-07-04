# .bashrc for Ubuntu
# ========================================================================
# - https://github.com/wasabi315/dotfiles
# - wasabi.nvim.st@gmail.com


# System default ---------------------------------------------------------

export PLATFORM=$(uname -s)
[ -f /etc/bashrc ] && . /etc/bashrc

# Options ----------------------------------------------------------------

shopt -s cdspell
shopt -s checkwinsize
shopt -s histappend
shopt -s no_empty_cmd_completion

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

# if [ -x /usr/bin/dircolors ]; then
#   eval eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias vdir='vdir --color=auto'
    alias dir='dir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
# fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias c='clear'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd=cdls

function cdls() {
    \cd $1;
    ls;
}

alias vi='nvim'

alias mk='touch'
alias mkdir='mkdir -p -v'

alias scat='sudo cat'
alias svi='sudo vi'
alias root='sudo su'


# Prompt -----------------------------------------------------------------

color_prompt=yes

if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    source ~/.git-completion.bash

    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM=1

    PS1='\[\e[01;34m\][ \w\[\e[01;33m\]$(__git_ps1)\[\e[00m\]\[\e[01;34m\] ]\[\e[00m\]\n\[\e[01;32m\]\A\[\e[00m\] \$ '
else
    PS1='\[\e[01;34m\][ \w ]\[\e[00m\]\n\[\e[01;32m\]\A\[\e[00m\] \$ '
fi

