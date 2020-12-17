#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo "--- $m ---" | tee -a /tmp/main_bar.log 
    MONITOR=$m polybar --reload main_bar >> /tmp/main_bar.log 2>&1 & 
  done
else
  echo "---" | tee -a /tmp/main_bar.log 
  polybar --reload main_bar >> /tmp/main_bar.log 2>&1 &
fi

echo "Bars launched..."

