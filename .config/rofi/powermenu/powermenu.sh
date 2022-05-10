#!/usr/bin/env bash

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$($HOME/.scripts/usedcpu)
memory=$($HOME/.scripts/usedram)

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		
}


# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "祥  $uptime  |     $cpu  |  ﬙  $memory " -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		poweroff
		;;
    $reboot)
		reboot
		;;
	$lock)
		systemctl suspend
		;;
    $suspend)
		mpc -q pause
		pulsemixer --toggle-mute
		systemctl suspend
        ;;
    $logout)
		if [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
			bspc quit
		fi
		;;
esac
