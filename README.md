# `limaleomenezes`'s DOTFILES

- [Mastering ´stow´ on Linux: A Comprehensive Guide](https://linuxvox.com/blog/stow-linux-nixcraftcom/)

## Arch Install

Follow ArchWiki Installation Guide.

- [Installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot)
- [General recommendations](https://wiki.archlinux.org/title/General_recommendations)

Actions recommendaded:

- When creating a user add to group `video`.
- When editing `visudo` add `Defaults !tty_tickets`.

## arch-chroot

```
man-db man-pages
git
tmux
vim
```

## On Reboot

Follow this articles to do not forget a bit while building dmenu, st and dwm.

- [David T. Sadler's tutorial](https://davidtsadler.com/posts/arch/2020-08-17/installing-st-dmenu-dwm-in-arch-linux/)
- [suckless.org's tutorial](https://dwm.suckless.org/tutorial/)

Additionaly, install a status monitor. I use [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async). To get an overview: [status monitor](https://dwm.suckless.org/status_monitor/).

My dwm uses the patches below and apply a few sensible preferences. My dwm patch modifies `config.h`, so run `make` before patching at first time by yourself. To know how to [Hacking](https://suckless.org/hacking/).

- [push up/down](https://dwm.suckless.org/patches/push/)
- [fullgaps](https://dwm.suckless.org/patches/fullgaps/)
- [attachaside](https://dwm.suckless.org/patches/attachaside/)
- [xrdb](https://dwm.suckless.org/patches/xrdb/)

My dwmblocks shows the stuff below.

- DO NOT DISTRUB
- VPN
- TIMEDATE
- BRIGHTNESS
- VOLUME
- NETWORK
- BATTERY
- MEMORY
- LOADAVG

Basic packages and command:

```
# --- X LIB
sudo pacman -S \
	libx11 libxft libxinerama \
	xorg-server xorg-xinit \
	xterm

# --- FONTS
sudo pacman -S  \
	terminus-font \
	ttf-inconsolata \
	ttf-liberation \
	ttf-linux-libertine

# --- X KEYMAP LAYOUT
setxkbmap br -option caps:escape_shifted_capslock
localectl set-x11-keymap br "" "" caps:escape_shifted_capslock

# --- Enable Touchpad tapping
xinput set-prop "PNP0C50:0b 093A:0255 Touchpad" "libinput Tapping Enabled" 1
```

## The Environment

### Packages

```
chromium
firefox
gvim
htop
lxappearance-gtk3 pop-gtk-theme pop-icon-theme deepin-icon-theme
mpv
nnn
nsxiv xwallpaper
pass
pcmanfm-gtk3 xarchiver p7zip unrar unzip zip gvfs gvfs-
zathura zathura-pdf-mupdf tesseract-data-eng tesseract-data-por tesseract-data-jpn

alsa-utils
brightnessctl
dunst libnotify
picom
pipewire pipewire-audio pipewire-jack pipewire-alsa pipewire-pulse wireplumber
polkit-gnome
redshift
sxhkd
wireguard-tools systemd-resolvco

bash-completion
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
```

### Usage recommendations

- Use `firefox` as a clean browser and `chromium` as dirty one.
- Use `vim`.
- Use `nmtui` to connect to Wi-Fi networks.
- Use `alsamixer` if you need control mixers.
- Install [vim-plug](https://github.com/junegunn/vim-plug).
- Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm).

Complete the environment setup:

```
# --- Enable pipewire service
systemctl --user enable pipewire
systemctl --user enable pipewire-pulse
systemctl enable systemd-resolved

# --- Update pkgfile database
sudo pkgfile -u

# --- Change permission of GnuPG homedir:
chmod 600 ~/.gnupg/*
chmod 700 ~/.gnupg

# Add VPN server config /etc/wireguard/

# Update MIME database
update-mime-database ~/.local/share/mime
```

## References

People:

- [Luke Smith](https://lukesmith.xyz/)
- [davidtsadler.com](https://davidtsadler.com/)
- [juliu.is](https://juliu.is/)
- [steinbaugh.com](https://steinbaugh.com/)

Articles:

- [ArchWiki; Xorg/Keyboard configuration](https://wiki.archlinux.org/title/Xorg/Keyboard_configuration)
- [ArchWiki: xinput](https://wiki.archlinux.org/title/Xinput)
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
- [ArchWiki: mpv](https://wiki.archlinux.org/title/Mpv)
- [ArchWiki: yt-dlp](https://wiki.archlinux.org/title/Yt-dlp)
- [ArchWiki: zathura](https://wiki.archlinux.org/title/Zathura)
- [ArchWiki: MuPDF](https://wiki.archlinux.org/title/MuPDF)
- [ArchWiki: sxiv](https://wiki.archlinux.org/title/Sxiv)
- [ArchWiki: st](https://wiki.archlinux.org/title/St)
- [ArchWiki: XDG MIME Applications](https://wiki.archlinux.org/title/XDG_MIME_Applications)
- [ArchWiki: XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory)
- [ArchWiki: Environment variables](https://wiki.archlinux.org/title/Environment_variables)
- [ArchWiki: xbindkeys](https://wiki.archlinux.org/title/Xbindkeys)

