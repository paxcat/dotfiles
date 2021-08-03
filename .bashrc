#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias vim='nvim'

# PS1='[\u@\h \W]\$ '
PS1='\[\e[0;35m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\]\[\e[0;37m\] '
