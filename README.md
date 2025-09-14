# Leonardo Menezes' DOTFILES

The `install.sh` script uses `pacman` as package manager. If you plan to
test this configuration setup in any Ubuntu or Fedora based distros
replace the `CMD_INSTALL` variable.

I am pretty comfortable using [Arch Linux](https://archlinux.org/). The
idea of my setup is to work around a bare-bones distro. Just having the
essential tools with sensible configuration, I can work with precision.

There is the **Automatic Setup** and the **Manual Setup**. Both requires
a correct installation of your distro. For Arch, the must-have
references:

- [Installation guide](https://wiki.archlinux.org/title/Installation_guide)
- [systemd-boot](https://wiki.archlinux.org/title/Systemd-boot)
- [General recommendations](https://wiki.archlinux.org/title/General_recommendations)

As a general recommendation:

- Add your User to groups: `video` and `docker`.
- Add into `visudo`: `Defaults !tty_tickets`.
- Install the packages:

```
sudo pacman -S man-db man-pages git tmux vim
```

---

# Automatic Setup

Just run the commands below.

```
git clone https://github.com/limaleomenezes/dotfiles.git \
&& cd ./dotfiles \
&& chmod +x ./install.sh \
&& ./install.sh --setup
```

---

# Manual Setup

Now you have a bare-bones system installed. You need to setup X11
environment, *the stage where the magic happens*. With the David Sadler
instructions you will have a nice running desktop, a great start point!
Then, with Luke Smith video will know you need later.

- [Installing ST, DMENU and DWM in Arch Linux](https://davidtsadler.com/posts/arch/2020-08-17/installing-st-dmenu-dwm-in-arch-linux/)
- [After a Minimal Linux Install: Graphical Envionment and Users](https://youtu.be/nSHOb8YU9Gw?feature=shared)

Remember, the `~/.xinitrc` file is a script. A good practice is adding a
shebang `!/bin/sh` and give execution permission `chmod +x`. About `dwm`
usage, suckless.org website have all the basics, including how to patch.
Then, choose some status monitor, I use
[dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async).

- [suckless.org dwn tutorial](https://dwm.suckless.org/tutorial/)
- [suckless.org Hacking](https://suckless.org/hacking/)
- [suckless.org dwm status monitor](https://dwm.suckless.org/status_monitor/)

Patches recommendation:

- [push up/down](https://dwm.suckless.org/patches/push/)
- [fullgaps](https://dwm.suckless.org/patches/fullgaps/)
- [attachaside](https://dwm.suckless.org/patches/attachaside/)
- [xrdb](https://dwm.suckless.org/patches/xrdb/)

Something good to learn when using Arch is consult the **ArchWiki** what you
have any doubt! Try the parameter `--help` or `-h` and read the *man
page*.

An usual thing to do is configure the keyboard layout and the touchpad
device if applicable.

- [Xorg/Keyboard configuration](https://wiki.archlinux.org/title/Xorg/Keyboard_configuration)
- [libinput](https://wiki.archlinux.org/title/Libinput)

```
# --- X KEYMAP LAYOUT
setxkbmap br -option caps:escape_shifted_capslock
localectl set-x11-keymap br "" "" caps:escape_shifted_capslock

# --- Enable Touchpad tapping
xinput set-prop "PNP0C50:0b 093A:0255 Touchpad" "libinput Tapping Enabled" 1
```
