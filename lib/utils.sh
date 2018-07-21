#!/bin/bash

# shell script utilities

CLEAR=$(tput sgr0)
BOLD=$(tput bold)
BLACK=${BOLD}$(tput setaf 0)
RED=${BOLD}$(tput setaf 1)
GREEN=${BOLD}$(tput setaf 2)
YELLOW=${BOLD}$(tput setaf 3)
BLUE=${BOLD}$(tput setaf 4)
PURPLE=${BOLD}$(tput setaf 5)
CYAN=${BOLD}$(tput setaf 6)
GRAY=${BOLD}$(tput setaf 7)


bot() {
    echo -e "${GRAY}$1${CLEAR}"
}

running() {
    echo -e "${BOLD}==> $1...${CLEAR}"
}

ok() {
    echo -e "${GREEN}[OK]${CLEAR} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${CLEAR} $1"
}

error() {
    echo -e "${RED}[ERROR]${CLEAR} $1"
}

