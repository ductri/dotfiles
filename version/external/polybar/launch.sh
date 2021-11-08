#!/bin/bash
## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
echo $UID
while pgrep -u $UID "polybar" >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo "--- $m ---" | tee -a $HOME/tmp/main_bar.log 
#   MONITOR=$m polybar --reload main_bar >> /tmp/main_bar.log 2>&1 & 
    MONITOR=$m polybar -l info top -c ~/.config/polybar/config-top.ini > $HOME/tmp/top.log 2>&1 &
    MONITOR=$m polybar -l info bottom -c ~/.config/polybar/config-bottom.ini > $HOME/tmp/bottom.log 2>&1 &
  done
else
  echo "---" | tee -a $HOME/tmp/main_bar.log 
  MONITOR=$m polybar --reload top -c ~/.config/polybar/config-top.ini &
  MONITOR=$m polybar --reload bottom -c ~/.config/polybar/config-bottom.ini &
#  polybar --reload main_bar >> /tmp/main_bar.log 2>&1 &
fi

