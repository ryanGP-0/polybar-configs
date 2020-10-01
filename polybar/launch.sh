#!/usr/bin/env sh
modprobe v4l2loopback video_nr=10 card_label="Virtual Cam"
./.config/polybar/scripts/launchlistener.sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c $HOME/.config/polybar/config.ini &
