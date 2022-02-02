#!/bin/bash

if [[ "$1" == "hd" ]]; then
    python ~/.config/alacritty/change_font_size.py 15.0
    python ~/.config/qutebrowser/change_font_size.py 100
    echo "updated to hd"
elif [[ "$1" == "4k" ]]; then
    python ~/.config/alacritty/change_font_size.py 20.0
    python ~/.config/qutebrowser/change_font_size.py 160
    echo "updated to 4k"
else
    echo "only hd or 4k"
fi
