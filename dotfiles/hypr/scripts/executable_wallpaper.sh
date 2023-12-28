#!/bin/bash
#                _ _
# __      ____ _| | |_ __   __ _ _ __   ___ _ __
# \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
#  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
#   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
#                   |_|         |_|
#
# by Stephan Raabe (2023)
# -----------------------------------------------------
#wallpaper= "/home/aaron/wallpaper/"
case $1 in

# Load wallpaper from .cache of last session
"init")
	if [ -f ~/.cache/current_wallpaper.jpg ]; then
		wal -q -i ~/.cache/current_wallpaper.jpg
	else
		wal -q -i ~/wallpaper/
	fi
	;;

# Select wallpaper with rofi
"select")
	selected=$(ls -1 ~/wallpaper | grep "jpg" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-wallpaper.rasi)
	if [ ! "$selected" ]; then
		echo "No wallpaper selected"
		exit
	fi
	wal -q -i ~/wallpaper/$selected
	;;

# Randomly select wallpaper
*)
	wal -q -i ~/wallpaper/
	;;

esac

# -----------------------------------------------------
# Set the new wallpaper
# -----------------------------------------------------
transition_type="random"
# transition_type="outer"
# transition_type="random"

export SWWW_TRANSITION_FPS=144
export SWWW_TRANSITION_STEP=2
export SWWW_TRANSITION_TYPE=random
export SWW_TRANSITIION_BEZIER=.43,1.19,1,.4
export SWW_TRANSITION_DURATION=0.7
#export SWW_TRANSITION_POS="$(hyprctl cursorpos)"

echo "Wallpaper: $wallpaper"
# This controls (in seconds) when to switch to the next image
INTERVAL=1200

while true; do

	wal -q -i ~/wallpaper/
	# -----------------------------------------------------
	# Load current pywal color scheme
	# -----------------------------------------------------
	source "$HOME/.cache/wal/colors.sh"
	echo "Wallpaper: $wallpaper"

	# -----------------------------------------------------
	# Copy selected wallpaper into .cache folder
	# -----------------------------------------------------
	cp $wallpaper ~/.cache/current_wallpaper.jpg

	# -----------------------------------------------------
	# get wallpaper iamge name
	# -----------------------------------------------------
	newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

	# -----------------------------------------------------
	# Reload waybar with new colors
	# -----------------------------------------------------
	~/dotfiles/waybar/launch.sh

	# -----------------------------------------------------
	# Send notification
	# -----------------------------------------------------
	sleep 1
	notify-send "Colors and Wallpaper updated" "with image $newwall"

	echo "DONE!"
	swww img $wallpaper
	sleep $INTERVAL
done

#swww img $wallpaper \
#	--transition-bezier .43,1.19,1,.4 \
#	--transition-fps=144 \
#	--transition-type=$transition_type \
#	--transition-duration=0.7 \
#	--transition-pos "$(hyprctl cursorpos)"
