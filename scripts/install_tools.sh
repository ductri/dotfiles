#!/bin/bash

./install_alacrity.sh
./install_rofi.sh
./install_mpsyt.sh

pip install flashfocus

sudo apt install kanshi
mkdir -p ~/.config/kanshi && touch ~/.config/kanshi/config
