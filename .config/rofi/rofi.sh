#!/bin/bash -eu

#
# File:        ~/.config/rofi/rofi.sh
# Maintainer:  wasabi315
# Modified:    2018-7-23
# License:     MIT
#

rofi -show combi -width $(xwininfo -root | awk '/Width/ { print $2 }')
