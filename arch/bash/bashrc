#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \w]\$ '
PS1='[\[\e[1;34m\]\u@\h\[\e[0m\] \W]\[\e[1;32m\]\$\[\e[0m\] '

VIMRUNTIME=/usr/bin
export EDITOR=/usr/bin/vim

export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin
#export PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]#\[\e[m\] \[\e[0;32m\]'
alias vimbackup="mkdir -pv .backup/ && mv -v *~ .backup/"
alias vimswp="rm -v .*.swp"
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
alias escrotum='escrotum "~/Pictures/Screenshots/%Y-%m-%d-%H%M%S_\$wx\$h_escrotum.png"'
export TERM=xterm-256color
alias cls='printf "\033c"'
alias tree='tree -C'
alias such='git'
alias much='git'
alias wow='git push'
