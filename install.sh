#!/bin/sh

echo "Install vimrc"
cp vimrc ~/.vimrc
echo 

echo "Install tmux.conf"
cp tmux.conf ~/.tmux.conf
echo 

echo "Install UltiSnips"
cp UltiSnips/* ~/.vim/UltiSnips/
echo 

echo "Install latexmkrc"
cp latexmkrc ~/.latexmkrc 
echo 

echo "Install zathurarc"
cp zathurarc ~/.config/zathura/zathurarc 
echo 

echo "Not install bashrc"
echo 

echo "Not install  bash_aliases"
echo 

echo "Install latexmkrc"
cp latexmkrc ~/.latexmkrc 

echo "Install nerdtree_plugin"
cp fs_menu.vim ~/.vim/plugged/nerdtree/nerdtree_plugin/fs_menu.vim 
echo 

echo "Install i3"
cp -r i3 ~/.config/
echo 

echo "Install polybar"
cp -r polybar ~/.config/
echo 

