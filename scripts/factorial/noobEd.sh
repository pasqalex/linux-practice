#!/bin/bash

clear

fuck() {
local inpt=$1

	if [ "$inpt" -gt 1 ] ; then
		local temp=$(( inpt - 1 ))
		local result=$(fuck $temp)
		echo $(( result * inpt ))	
	elif [ "$inpt" -lt 0 ] ; then
		echo "Факториал отрицательного числа не определен! " >&2
	elif [ "$inpt" -eq 0 ] ; then
		echo 1
	elif [ "$inpt" -eq 1 ] ; then
		echo 1
	fi
}

read -p "Факториал какого числа интересует? " value

if ! [[ "$value" =~ ^[0-9]+$ ]] ; then
	echo "$value - не является числом!" >&2
	exit 1
fi

result=$(fuck "$value")
echo "Результат: $result"
