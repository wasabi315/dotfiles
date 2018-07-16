#!/bin/bash -eu

suspend="Suspend"
reboot="Reboot"
shutdown="Shutdown"

content="$suspend\n$reboot\n$shutdown"

echo -e $content
case $@ in
    $suspend)
        systemctl suspend ;;
    $reboot)
        systemctl reboot ;;
    $shutdown)
        systemctl poweroff ;;
esac

