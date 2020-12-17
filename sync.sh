#!/bin/sh

echo "Save vimrc"
cp ~/.vimrc vimrc
echo 

echo "Save tmux.conf"
cp ~/.tmux.conf tmux.conf
echo 

echo "Save UltiSnips"
mkdir -p UltiSnips
cp ~/.vim/UltiSnips/* UltiSnips/
echo 

echo "Save latexmkrc"
cp ~/.latexmkrc latexmkrc
echo 

echo "Save zathurarc"
cp ~/.config/zathura/zathurarc zathurarc
echo 

echo "Save bashrc"
cp ~/.bashrc bashrc
echo 

echo "Save bash_aliases"
cp ~/.bash_aliases bash_aliases
echo 

echo "Save latexmkrc"
cp ~/.latexmkrc latexmkrc
echo 

echo "Save nerdtree_plugin"
cp ~/.vim/plugged/nerdtree/nerdtree_plugin/fs_menu.vim  fs_menu.vim
echo 

echo "Save i3 config"
cp -r ~/.config/i3 .
echo 

echo "Save polybar config"
cp -r ~/.config/polybar .
echo 

echo "Save rofi config"
cp -r ~/.config/rofi .
echo 

echo "Save touchpad config for i3"
cp /etc/X11/xorg.conf.d/90-touchpad.conf 90-touchpad.conf

echo "Save fonts"
cp -r ~/.fonts fonts

echo "Save gtk config"
mkdir -p gtk
cp ~/.gtkrc-2.0 gtk/.gtkrc-2.0

echo "Gnome terminal profile"
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf

