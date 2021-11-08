#!/bin/sh
set -e
LOAD_TO=~/code/dotfiles/version/$1/


echo "----------------------------"
echo "Install zathurarc"
mkdir -p ~/.config/zathura/
cp $LOAD_TO/zathurarc ~/.config/zathura/zathurarc 
echo 

echo "----------------------------"
echo "Install sway config"
# cp -r $LOAD_TO/sway ~/.config/
rsync -av --exclude='*.swp' $LOAD_TO/sway ~/.config
echo

echo "----------------------------"
echo "Install alacritty config"
mkdir -p ~/.config/alacritty/
cp  $LOAD_TO/alacritty.yml ~/.config/alacritty/alacritty.yml
echo

echo "----------------------------"
echo "Install Xresources"
cp $LOAD_TO/Xresources ~/.Xresources
echo

echo "----------------------------"
echo "Install waybar"
# cp -r $LOAD_TO/waybar ~/.config/
rsync -av --exclude='*.swp' $LOAD_TO/waybar ~/.config
echo

echo "----------------------------"
echo "Install waybar"
cp -r $LOAD_TO/waybar ~/.config/
echo

echo "----------------------------"
echo "Install qutebrowser"
rsync -av --exclude='*.swp' $LOAD_TO/qutebrowser ~/.config
echo

echo "----------------------------"
echo "Update Xresources"
xrdb ~/.Xresources

