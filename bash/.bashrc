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
alias la='ls -ACF'
alias ll='ls -AFl'
alias grep='grep --color=auto'

alias l='ls -CF'
alias v='vim'

alias d='sudo docker'
alias dc='sudo docker-compose'

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

#
# nnn
#
export NNN_BMS="d:$HOME/Documents;D:$HOME/Docs archive/"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip)$"
export NNN_COLORS='4321'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_SEL='/tmp/.sel'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_TMPFILE='/tmp/.lastd'
export NO_COLOR=1

n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

#
# Prompt
#
PS1='[\u@\h \W]\$ '
