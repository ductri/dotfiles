#!/bin/sh

read -p "Do you want to proceed? (yes/no)" yn
if [[ $yn == "yes" ]]; then
    SAVE_TO=./version/$1
    echo "Saving to "$SAVE_TO
    mkdir -p $SAVE_TO/

    echo "Save vimrc"
    cp ~/.vimrc $SAVE_TO/vimrc
    echo 

    echo "Save tmux.conf"
    cp ~/.tmux.conf $SAVE_TO/tmux.conf
    echo 

    echo "Save UltiSnips"
    mkdir -p $SAVE_TO/UltiSnips
    cp ~/.vim/UltiSnips/* $SAVE_TO/UltiSnips/
    echo 


    echo "Save zathurarc"
    cp ~/.config/zathura/zathurarc $SAVE_TO/zathurarc
    echo 

    echo "Save bashrc"
    cp ~/.bashrc $SAVE_TO/bashrc
    echo 

    echo "Save bash_aliases"
    cp ~/.bash_aliases $SAVE_TO/bash_aliases
    echo 


    echo "Save nerdtree_plugin"
    cp ~/.vim/plugged/nerdtree/nerdtree_plugin/fs_menu.vim  $SAVE_TO/fs_menu.vim
    echo 

    echo "Save i3 config"
    cp -r ~/.config/i3 $SAVE_TO/.
    echo 

    echo "Save polybar config"
    cp -r ~/.config/polybar $SAVE_TO/.
    echo 

    echo "Save rofi config"
    cp -r ~/.config/rofi $SAVE_TO/.
    echo 

    echo "Save touchpad config for i3"
    cp /etc/X11/xorg.conf.d/90-touchpad.conf $SAVE_TO/90-touchpad.conf
    echo

    echo "Save fonts"
    cp -r ~/.fonts $SAVE_TO/fonts
    echo

    echo "Save gtk config"
    mkdir -p $SAVE_TO/gtk
    cp ~/.gtkrc-2.0 $SAVE_TO/gtk/.gtkrc-2.0
    echo

    echo "Gnome terminal profile"
    dconf dump /org/gnome/terminal/legacy/profiles:/ > $SAVE_TO/gnome-terminal-profiles.dconf
    echo

    echo "Save compton"
    cp ~/.config/compton.conf $SAVE_TO/compton.conf
    echo

    echo "Save pavocontrol config"
    cp /etc/pulse/default.pa $SAVE_TO/default.pa
    echo

    echo "Save sway config"
    cp -r ~/.config/sway $SAVE_TO/sway
    echo

    echo "Save alacritty config"
    cp  ~/.config/alacritty/alacritty.yml $SAVE_TO/alacritty.yml 
    echo

    echo "Save Xresources"
    cp  ~/.Xresources $SAVE_TO/Xresources
    echo

    echo "Save tlp"
    cp  /etc/tlp.conf $SAVE_TO/tlp.conf
    echo

    echo "Save waybar"
    cp -r ~/.config/waybar $SAVE_TO/
    echo

    echo "Save grimshot script"
    cp -r ~/.local/bin/grimshot $SAVE_TO/grimshot
    echo 

    echo "Save google-chrome. It is just for scaling factor to fit dpi"
    cp  /usr/bin/google-chrome-stable $SAVE_TO/google-chrome-stable
    echo 

    echo "Save kanshi"
    cp -r ~/.config/kanshi $SAVE_TO/kanshi
    echo 

    echo "Save qutebrowser"
    cp -r ~/.config/qutebrowser $SAVE_TO/
    echo 

    echo "Save local bin directory"
    mkdir -p local_bin
    cp -r ~/.local/bin $SAVE_TO/local_bin
    echo
else
    echo "Script has not been run.";
fi
