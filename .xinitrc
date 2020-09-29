#!/bin/sh

# xinitrc runs automatically when you run startx.

dwmbar &
xset r rate 300 50 &
wallpaper /HDD/wallpapers/nord.png
sxhkd -c ~/.config/sxhkd/sxhkdrc &
export _JAVA_AWT_WM_NONREPARENTING=1 # to make android studio work
setxkbmap pl
exec dwm


