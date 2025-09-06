# Arch Install

Follow ArchWiki Installation Guide.

- [Installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot)
- [General recommendations](https://wiki.archlinux.org/title/General_recommendations)

Actions recommendaded:

- When creating a user add to group `video`.
- When editing `visudo` add `Defaults !tty_tickets`.
- Clone [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async).

# ARCH-CHROOT

```
man-db man-pages
git
tmux
vim
```

# On Reboot

Follow [David T. Sadler](https://davidtsadler.com/) tutorial.

- [Installing ST, DMENU and DWM in Arch Linux](https://davidtsadler.com/posts/arch/2020-08-17/installing-st-dmenu-dwm-in-arch-linux/)
- [dwm tutorial](https://dwm.suckless.org/tutorial/)

Packages that I install and things that I do:

```
#
# X LIB
#
sudo pacman -S \
	libx11 libxft libxinerama \
	xorg-server xorg-xinit \
	xterm

#
# FONTS
#
sudo pacman -S  \
	terminus-font \
	ttf-inconsolata \
	ttf-liberation \
	ttf-linux-libertine

#
# X KEYMAP LAYOUT
#
setxkbmap br -option caps:escape_shifted_capslock
localectl set-x11-keymap br "" "" caps:escape_shifted_capslock
```

# My Environment Overview

## System packages

```
sudo pacman -S \
	chromium \
	entr \
	firefox \
	gvim \
	htop \
	lxappearance-gtk3 pop-gtk-theme pop-icon-theme deepin-icon-theme \
	pass \
	pcmanfm-gtk3 xarchiver p7zip unrar unzip zip gvfs gvfs-mtp

sudo pacman -S \
	alsa-utils \
	dunst libnotify \
	brightnessctl \
	picom \
	pipewire pipewire-audio pipewire-jack pipewire-alsa pipewire-pulse wireplumber \
	redshift \
	polkit-gnome \
	sxhkd \
	wireguard-tools systemd-resolvconf

sudo pacman -S \
	bash-completion \
	pkgfile \
	xclip xsel \
	xdotool \
	xorg-xprop
```

## Files and folders

```
~/.local/bin/
~/.local/src/
~/.password-store/

~/.Xresources
~/.bash_logout
~/.bash_profile
~/.bashrc
~/.config/picom/picom.conf
~/.config/redshift/redshift.conf
~/.config/sxhkd/sxhkdrc
~/.gitconfig
~/.gnupg/gpg-agent.conf
~/.tmux.conf
~/.vimrc
~/.xinitrc
```

## Usage recommendations

- Use `firefox` as a clean browser and `chromium` as dirty one.
- Use `vim`.
- Use `nmtui` to connect to Wi-Fi networks.
- Use `alsamixer` if you need control mixers.

Enable systemd services and update things:

```
#
# Enable pipewire service
#
systemctl --user enable pipewire
systemctl --user enable pipewire-pulse
systemctl enable systemd-resolved

#
# Update pkgfile database
#
sudo pkgfile -u

#
# Add VPN server config /etc/wireguard/
#

#
# Change permission of GnuPG homedir:
# chmod 600 ~/.gnupg/*
# chmod 700 ~/.gnupg
#
```

### Tmux

- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

# References

- [Luke Smith](https://lukesmith.xyz/)
- [davidtsadler.com](https://davidtsadler.com/)
- [juliu.is](https://juliu.is/)
- [steinbaugh.com](https://steinbaugh.com/)


- [ArchWiki; Xorg/Keyboard configuration](https://wiki.archlinux.org/title/Xorg/Keyboard_configuration)
- [ArchWiki: dwm](https://wiki.archlinux.org/title/Dwm)
- [ArchWiki: xinit](https://wiki.archlinux.org/title/Xinit)
- [ArchWiki: Redshift](https://wiki.archlinux.org/title/Redshift)
- [ArchWiki: Backlight](https://wiki.archlinux.org/title/Backlight)
- [ArchWiki: Bash](https://wiki.archlinux.org/title/Bash)
- [ArchWiki: pkgfile](https://wiki.archlinux.org/title/Pkgfile)
- [ArchWiki: Readline](https://wiki.archlinux.org/title/Readline)
- [ArchWiki: Conky](https://wiki.archlinux.org/title/Conky)
- [ArchWiki: picom](https://wiki.archlinux.org/title/Picom)
- [ArchWiki: sxhkd](https://wiki.archlinux.org/title/Sxhkd)
- [ArchWiki: Advanced Linux Sound Architecture](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture)
- [ArchWiki: GnuPG](https://wiki.archlinux.org/title/GnuPG)
- [ArchWiki: Dunst](https://wiki.archlinux.org/title/Dunst)
- [ArchWiki: X resources](https://wiki.archlinux.org/title/X_resources)
- [ArchWiki: WireGuard](https://wiki.archlinux.org/title/WireGuard)
- [ArchWiki: pass](https://wiki.archlinux.org/title/Pass)

