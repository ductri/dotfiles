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

Ultilities:
- Slack
- Dropbox
- Zoom

Backlight problems:
- https://wiki.archlinux.org/index.php/Backlight#ACPI
- https://badsimplicity.com/2020/01/28/screen-brightness-control-on-i3wm-for-lenovo-x240-ubuntu/
