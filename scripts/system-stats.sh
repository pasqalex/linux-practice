#!/bin/bash
set -e

DATE=$(date +%d-%B-%Y)

logFile="/home/<USER>/script-logs/system-stats_$DATE.log"

echo -n "Starting the data collection"
sleep 1
echo -n "."
sleep 1
echo -n "." #just for fun. Just delete this ^^
sleep 1
echo -n "."
sleep 2
echo ""

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
                apt list --upgradable 2>/dev/null || true
                echo ""
}

function all_checks() {
        memory
        cpu
        disk
        upgrades
}


mkdir -p /home/<USER>/script-logs
all_checks >> "$logFile" 2>&1

echo "All stats saved -->  $logFile  SUCCESSFULLY!" >&2
