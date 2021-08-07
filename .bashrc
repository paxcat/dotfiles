#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias vim='nvim'
alias setwp='xwallpaper --zoom'
alias update='sudo pacman -Syyu'
alias remove='sudo pacman -Rsn'

# PS1='[\u@\h \W]\$ '
PS1='\[\e[1;35m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\]\[\e[1;37m\] '
