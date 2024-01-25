#!/usr/bin/env bash

## Author  : Aditya Shakya (adi1090x)
## Github  : @adi1090x
#
## Applets : Quick Links

# Import Current Theme

dir="$HOME/.config/rofi/launchers/"
theme='style_4'

# Theme Elements
prompt='Select GPU'
list_col='1'
list_row='2'
efonts="JetBrains Mono Nerf Font 10"

# Options
option_1=" Dedicated GPU"
option_2=" Integrated GPU"

gpu_info=$(lspci | grep -i GeForce)

if [[ -z "$gpu_info" ]]; then
	default_option="$option_2"
else
	default_option="$option_1"
fi

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-theme ${dir}/${theme}.rasi -m 2
}

# Pass variables to rofi dmenu
run_rofi() {
	
	if [[ -z "$gpu_info" ]]; then
		echo -e "$option_2\n$option_1" | rofi_cmd
	else
		echo -e "$option_1\n$option_2" | rofi_cmd
	fi
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		sudo envycontrol -s hybrid
		reboot
	elif [[ "$1" == '--opt2' ]]; then
		sudo envycontrol -s integrated
		reboot
	fi
}



# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
esac
