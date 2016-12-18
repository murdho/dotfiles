#!/bin/zsh

plugins=(git github git-flow ssh-agent rails vagrant)
source $ZSH/oh-my-zsh.sh
[ -r ~/.aliasrc ] && . ~/.aliasrc

clear
shift
eval $@
