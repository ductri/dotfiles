#!/bin/bash

# Icon name: https://specifications.freedesktop.org/icon-naming-spec/latest/

notify-send -u low -t 2000 -i face-cool "Connecting to Tri's Sony WH-1000XM4 ..."
bluetoothctl connect AC:80:0A:EE:0F:13
notify-send -u low -t 2000 -i user-available "Connected successfully to Tri's Sony WH-1000XM4"

