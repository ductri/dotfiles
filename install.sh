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
