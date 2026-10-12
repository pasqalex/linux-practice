#!/bin/bash

set -e

DATE=$(date +%d-%B-%Y)

logFile="/home/lllyt/script-logs/system-stats_$DATE.log"

green='\e[32m'
blue='\e[34m'
red='\e[31m'
clear='\e[0m'

ColorBlue() {
        echo -ne "${blue}${1}${clear}"
}

ColorGreen() {
        echo -ne "${green}${1}${clear}"
}

function memory() {
        echo ""
                echo "The current memory usage is: "
                free -h
                echo ""
}

function disk() {
        echo ""
                echo "The current disk usage is: "
                df -h
                echo ""
}

function cpu() {
        echo ""
                echo "CPU load is: "
                echo ""
                uptime
                echo ""
}

function upgrades() {
        echo ""
                echo "Available upgrades: "
                apt list --upgradable 2>/dev/null
                echo ""
}

function all_checks() {
        memory
        cpu
        disk
        upgrades
}

menu() {
echo -ne "
$(ColorBlue '1)') Memory usage
$(ColorBlue '2)') Disk usage
$(ColorBlue '3)') CPU load
$(ColorBlue '4)') Check updates
$(ColorBlue '5)') Start all actions
$(ColorBlue '0)') Exit"
echo ""
read -p "Choose an action: " keyboardInput

if [[ $keyboardInput == 5 ]] ; then
echo -n "Starting the data collection"
sleep 1
echo -n "."
sleep 1
echo -n "."
sleep 1
echo -n "."
sleep 2
fi

case $keyboardInput in
        1) memory ; menu ;;
        2) cpu ; menu ;;
        3) disk ; menu ;;
        4) upgrades ; menu ;;
        5) all_checks ; menu;;
        0) exit 0 ;;
        *) echo -e "${red}Wrong option${clear}" ; menu ;;
esac
}

menu
