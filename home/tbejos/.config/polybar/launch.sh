#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have een shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; 
done

# Launch bar
polybar tbejos &

echo "Bar launched..."
