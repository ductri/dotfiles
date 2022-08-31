#!/bin/bash
echo Downloading "$1" ...

yt-dlp --max-downloads 100 -P "/home/tringuyen/Videos/" -o "%(title)s.%(ext)s" "$1" 

