#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	printf '\n\n[START STARTX] [%s]\n' "$(date)" >> ~/.dwm.log
	exec startx >/dev/null 2>&1
fi
