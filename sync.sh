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

echo "Save .config"
mkdir -p config
cp -r ~/.config/* config/

echo "Save touchpad config for i3"
cp /etc/X11/xorg.conf.d/90-touchpad.conf 90-touchpad.conf

