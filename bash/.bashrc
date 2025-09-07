#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# Environment
#
export EDITOR=vim
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

#
# History
#

export HISTCONTROL="erasedups:ignorespace"

#
# Aliases
#

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias l='ls -CF'

alias la='ls -ACF'
alias ll='ls -AFl'

#
# Troubleshooting
#

# Line wrap on window size
shopt -s checkwinsize

#
# Prompt
#

# Command not found
source /usr/share/doc/pkgfile/command-not-found.bash

# Auto 'cd' when entering just a path
shopt -s autocd

# Prevent overwrite of files
set -o noclobber

PS1='[\u@\h \W]\$ '

