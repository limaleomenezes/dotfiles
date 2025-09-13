#!/bin/sh

CMD_INSTALL='sudo pacman -S'
stow_repo='bash
git
gnupg
mpv
picom
readline
redshift
scripts
sxhkd
tmux
vim
xdg
xorg
yt-dlp
zathura'
stow_path="$HOME/.config/git
$HOME/.config/mpv
$HOME/.config/picom
$HOME/.config/redshift
$HOME/.config/sxhkd
$HOME/.config/tmux
$HOME/.config/vim
$HOME/.config/yt-dlp
$HOME/.config/zathura
$HOME/.gnupg
$HOME/.local/bin"

case "$1" in
	'base')
		printf '%s\n' "$stow_path" | while IFS= read -r path; do
			mkdir -p -v "$path"
		done

		curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
		;;
	'stow')
		printf '%s\n' "$stow_repo" | while IFS= read -r pack; do
			stow -t $HOME -v 1 -S "$pack"
		done
		;;
	'stow-delete')
		printf '%s\n' "$stow_repo" | while IFS= read -r pack; do
			stow -t $HOME -v 1 -D "$pack"
		done
		;;
	'restow')
		printf '%s\n' "$stow_repo" | while IFS= read -r pack; do
			stow -t $HOME -v 1 -R "$pack"
		done
		;;
esac
