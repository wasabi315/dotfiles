#!/bin/bash -eu

# File:       run_or_raise.sh
# Maintainer: wasabi315
# License:    MIT
#
# Description:
#


run_or_raise() {

    [ $# -eq 3 ] || echo "run_or_raise: too many args!"

    [ "$(i3-msg "["$1"="$2"] focus")" = "[{\"success\":true}]" ] || i3-msg exec "$3"

}


