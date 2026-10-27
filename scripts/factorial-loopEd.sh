#!/bin/bash

clear

fuck() {
local inpt=$1
	local result=1
	local i=1
	while [ "$i" -le "$inpt" ] ; do
		result=$((result * i))
		i=$((i + 1))
	done
	echo "$result"
}

read -p "Факториал какого числа интересует? " value


if ! [[ "$value" =~ ^[0-9]+$ ]] ; then
	echo "$value - не является числом!" >&2
	exit 1
fi

result=$(fuck "$value")
echo "Результат: $result"
