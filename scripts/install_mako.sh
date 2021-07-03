#!/bin/bash

sudo apt install mako-notifier
sudo apt install apparmor-utils

sudo aa-disable /etc/apparmor.d/fr.emersion.Mako
notify-send "Install mako notification successfully"

