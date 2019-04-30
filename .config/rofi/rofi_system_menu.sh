#!/bin/bash -eu

#
# File:        ~/.config/rofi/rofi_system_menu.sh
# Maintainer:  wasabi315
# Modified:    2018-7-23
# License:     MIT
#

lock="Lock"
suspend="Suspend"
reboot="Reboot"
shutdown="Shutdown"

content="$lock\n$suspend\n$reboot\n$shutdown"

echo -e $content
case $@ in
    $lock)
        dm-tool lock ;;
    $suspend)
        systemctl suspend ;;
    $reboot)
        systemctl reboot ;;
    $shutdown)
        systemctl poweroff ;;
esac

