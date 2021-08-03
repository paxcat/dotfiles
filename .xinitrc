#!/bin/sh

setxkbmap latam &

xrandr -s 1366x768 &

picom -f &
picom --config ~/.config/picom/picom.conf &

xwallpaper --zoom ~/wallpapers/Hallstatt.jpg &

# slstatus &

while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done

exec dwm
