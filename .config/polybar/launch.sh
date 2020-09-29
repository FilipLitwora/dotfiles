#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

polybar left -r -c ~/.config/polybar/config.ini &
polybar right -r -c ~/.config/polybar/config.ini &
