#!/bin/bash
echo Downloading "$1" ...

yt-dlp --max-downloads 100 -P "/home/tringuyen/Music/youtube/" \
    -x --audio-format mp3 --no-keep-video -o "%(title)s.%(ext)s" "$1" 

