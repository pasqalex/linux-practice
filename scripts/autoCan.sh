#!/bin/bash

DATE=$(date +%d-%B-%Y)

echo "Garbage removal has begun!"

/bin/rm -rf /home/pasqalex/.local/share/Trash/files > /dev/null 2>&1 
/bin/rm -rf /home/pasqalex/.local/share/Trash/info > /dev/null 2>&1

/bin/mkdir -p /home/pasqalex/.local/share/Trash/files > /dev/null 2>&1
/bin/mkdir -p /home/pasqalex/.local/share/Trash/info > /dev/null 2>&1

echo "Successfully! $DATE"
echo "-----------------------------"
echo ""
