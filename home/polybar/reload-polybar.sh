#!/usr/bin/env bash
pkill -f '/run/current-system/sw/bin/polybar'

# Wait until the processes have actually exited
while pgrep -x polybar >/dev/null; do
    sleep 0.01
done

if type xrandr >/dev/null 2>&1; then
    for m in $(xrandr --query | awk '/ connected/{print $1}'); do
        MONITOR="$m" polybar primary &
    done
else
    polybar primary &
fi
