#! /bin/bash
# by: Brian Floersch
# requires: bc, inotify-tools
#

backlight="/sys/class/backlight/intel_backlight"

max=$(cat $backlight/max_brightness)

inotifywait -q -m -e close_write $backlight/brightness |
while read -r filename event; do
    cur=$(cat $backlight/brightness)
    val=$(echo "$cur / $max" | bc -l)
    echo $val
    xrandr --output eDP-1 --brightness "$val"
done

