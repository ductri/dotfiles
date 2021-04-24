- Install Vim PlugInstall plugin first
- Rsync all config under .confg
- Rsunc .fonts
- apt-get install lxappearance
- Restart
- feh
- arandr
- polybar:
    +   sudo dpkg-reconfigure fontconfig-config 
    +   sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf && fc-cache 
    +   Edit module bottom, change network interface
- Dracular theme for Gnome terminal
- rofi, i3-gap
- Followed https://www.youtube.com/watch?v=ARKIwOlazKI&t=1842s
- Brightness control: xbacklight
- One of plugin vim requires python3 and
    +   pip3 install pynvim 
- Compton
- Ranger 
- texlive-full
- pavucontrol
- vim-gtk


Ultilities:
- Slack
- Dropbox
- Zoom
- redshift
- scrot (for screen capture)
- blueman-manager

Backlight problems:
- https://wiki.archlinux.org/index.php/Backlight#ACPI
- https://badsimplicity.com/2020/01/28/screen-brightness-control-on-i3wm-for-lenovo-x240-ubuntu/


# Sway
- Alcaritty
- Setting PS1='\[\033[01;31m\]\t \[\033[01;32m\]Naruto \[\033[02;36m\]\h \[\033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"` \[\033[00m\]\n\$'
- grim, slurp, wl-copy, grimshot, shotman for screenshot. Juck run `grimshot check` to see if something is missing
- goldendict: its not completed. Currently, it runs with Xwayland. But I suppose it can Qt can run in wayland natively
- Rofi: now supports wayland
