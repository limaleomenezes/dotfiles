#!/bin/sh

stow_repo='bash
git
gnupg
mpv
picom
redshift
scripts
sxhkd
tmux
vim
xorg
zathura'

case "$1" in
	'link')
		printf '%s\n' "$stow_repo" | while IFS= read -r pack; do
			stow -t $HOME -v 1 -S "$pack"
		done
		;;
	'rm-link')
		printf '%s\n' "$stow_repo" | while IFS= read -r pack; do
			stow -t $HOME -v 1 -D "$pack"
		done
		;;
	'relink')
		printf '%s\n' "$stow_repo" | while IFS= read -r pack; do
			stow -t $HOME -v 1 -R "$pack"
		done
		;;
esac

