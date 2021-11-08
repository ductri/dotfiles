#!/bin/bash
# From https://askubuntu.com/questions/450604/how-to-get-the-current-upload-and-download-speeds-in-terminal
# The second answer

# awk '{if(l1){printf "%.2f kB/s, %.2f kB/s" ($2-l1)/1024 ($10-l2)/1024} else{l1=$2; l2=$10;}}'     \

awk '{if(l1){print ($2-l1)/1024 " " ($10-l2)/1024} else{l1=$2; l2=$10;}}'     \
<(grep wlp0s20f3 /proc/net/dev) <(sleep 1; grep wlp0s20f3 /proc/net/dev)

