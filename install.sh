#!/bin/sh

CMD_INSTALL='sudo pacman --noconfirm --needed -S'

packages='
# -------------------------------------------------------------------------
# XORG
# -------------------------------------------------------------------------
libx11 libxft libxinerama
xorg-server xorg-xinit
xterm

# -------------------------------------------------------------------------
# FONTS
# -------------------------------------------------------------------------
terminus-font
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
ttf-liberation
ttf-mononoki-nerd

# -------------------------------------------------------------------------
# DESKTOP
# -------------------------------------------------------------------------
chromium firefox
gvim
htop
lxappearance-gtk3 pop-gtk-theme pop-icon-theme deepin-icon-theme
mpv
nnn
nsxiv xwallpaper
pass
pcmanfm-gtk3 xarchiver p7zip unrar unzip zip gvfs gvfs-mtp
zathura zathura-pdf-mupdf tesseract-data-eng tesseract-data-por tesseract-data-jpn

# -------------------------------------------------------------------------
# SERVICES
# -------------------------------------------------------------------------
alsa-utils
brightnessctl
dunst libnotify
picom
pipewire pipewire-audio pipewire-jack pipewire-alsa pipewire-pulse wireplumber
polkit-gnome
redshift
sxhkd
wireguard-tools systemd-resolvconf

# -------------------------------------------------------------------------
# TOOLS
# -------------------------------------------------------------------------
bash-completion
docker docker-buildx docker-compose
entr
fzf
maim
pkgfile
ripgrep
stow
the_silver_searcher
xclip xsel
xdotool
xorg-xinput
xorg-xprop
yt-dlp
'
stow_packages='
bash
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
zathura
'
stow_make_dirs="
$HOME/.config/git
$HOME/.config/mpv
$HOME/.config/picom
$HOME/.config/redshift
$HOME/.config/sxhkd
$HOME/.config/tmux
$HOME/.config/vim
$HOME/.config/yt-dlp
$HOME/.config/zathura
$HOME/.gnupg
$HOME/.local/bin
"

install_packages() {
	packages=$(printf '%s' "$packages" | sed '/^#/d')

	printf '%s\n' "$packages" | while IFS= read -r pack; do
		if [ -n "$pack" ]; then
			eval "$CMD_INSTALL" "$pack"
		fi
	done

}

install_units() {
	systemctl --user enable pipewire
	systemctl --user enable pipewire-pulse

	sudo systemctl enable systemd-resolved
	sudo systemctl enable docker.socket

	sudo pkgfile -u
}

install_addons() {
	curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}

stow_make_dirs() {
	printf '%s\n' "$stow_make_dirs" | while IFS= read -r dir_path; do
		[ -n "$dir_path" ] && mkdir -p -v "$dir_path"
	done
}

stow_stow() {
	printf '%s\n' "$stow_packages" | while IFS= read -r pack; do
		[ -n "$pack" ] && stow -t $HOME -v 1 -S "$pack"
	done
}

stow_delete() {
	printf '%s\n' "$stow_packages" | while IFS= read -r pack; do
		[ -n "$pack" ] && stow -t $HOME -v 1 -D "$pack"
	done
}

stow_restow() {
	printf '%s\n' "$stow_packages" | while IFS= read -r pack; do
		[ -n "$pack" ] && stow -t $HOME -v 1 -R "$pack"
	done
}

make_patches() {
	origin_pwd=$(pwd)

	cd ~/.local/src/
	git clone https://git.suckless.org/st
	git clone https://git.suckless.org/dmenu
	git clone https://git.suckless.org/dwm
	git clone https://github.com/UtkarshVerma/dwmblocks-async

	cd ./dwm/
	make
	patch -p1 < "$origin_pwd/"dwm-leomenezes-6.6.diff
	sudo make clean install

	cd ../dwmblocks-async/
	make
	patch -p1 < "$origin_pwd/"dwmblocks-leomenezes-6.6.diff
	sudo make clean install

	cd "$origin_pwd"
}

build_patch() {
	origin_pwd=$(pwd)

	cd ~/.local/src/

	cd ./dwm/
	make clean

	cd ../dwmblocks-async/
	make clean

	cd ../
	git clone https://git.suckless.org/dwm temp1/
	git clone https://github.com/UtkarshVerma/dwmblocks-async temp2/

	diff -up ./temp1 ./dwm > \
		"$origin_pwd/dwm-leomenezes-6.6.diff"
	diff -up ./temp2 ./dwmblocks-async > \
		"$origin_pwd/dwmblocks-leomenezes-6.6.diff"

	rm -rf ./temp1
	rm -rf ./temp2

	cd "$origin_pwd"
}

help() {
	printf '
SYNOPSIS:

	./install.sh [OPTION] [-S|-sS|-sD|-sR]

OPTIONS:

	--setup		Do everything
	--stow		Stow packages
	--stow-delete	Unstow packages
	--stow-restow	Restow packages
	--build-patch	Patch:
			* dwm
			* dwmblocks
	\n'
}

case "$1" in
	'-h' | '--help' )
		help
		;;
	'--setup' )
		install_packages
		install_units
		install_addons
		stow_make_dirs
		stow_stow
		make_patches
		;;
	'--stow' )
		stow_make_dirs
		stow_stow
		;;
	'--stow-delete' )
		stow_delete
		;;
	'--stow-delete' )
		stow_restow
		;;
	'--build-patch' )
		build_patch
		;;
esac
