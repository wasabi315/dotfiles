#!/bin/bash -eu

rofi -show combi -width $(xwininfo -root | awk '/Width/ { print $2 }')
