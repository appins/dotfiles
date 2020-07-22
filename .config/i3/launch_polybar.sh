if type "xrandr"; then
	for m in $(xrandr --query | grep "connected" | cut -d" " -f1); do
		MONITOR=$m polybar -c ~/.config/i3/polybar-config top &
	done
else
	polybar -c ~/.config/polybar-config top &
fi
