#!/bin/bash -eu

#
# File:        ~/.config/rofi/rofi_system_menu.sh
# Maintainer:  wasabi315
# Modified:    2018-7-23
# License:     MIT
#

logout=" Logout"
suspend=" Suspend"
reboot=" Reboot"
shutdown=" Shutdown"

content="$logout\n$suspend\n$reboot\n$shutdown"

echo -e $content
case $@ in
    $logout)
        i3-msg exit ;;
    $suspend)
        systemctl suspend ;;
    $reboot)
        systemctl reboot ;;
    $shutdown)
        systemctl poweroff ;;
esac

