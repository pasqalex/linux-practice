#!/bin/bash

red='\e[31m'
green='\e[32m'
clear='\e[0m'

colorGreen() {
        echo -ne "${green}${1}${clear}"
}

colorRed() {
        echo -ne "${red}${1}${clear}"
}

greetings() {
clear

        echo -ne "| Hi! Welcome to my simple password generator based on /dev/urandom. |"
        printf "\n"
        echo "----------------------------------------------------------------------"
        printf "\n"
        read -p "Here we go? " go

                if ! [[ $go =~ ^(yes|y|yup|yeah|start!|go|start)$ ]] ; then
                        echo "$(colorRed 'Bye!')" ; exit 1
                fi
}

askLength() {
        while true ; do
                read -p "Enter password length (5 - 20 symbols): " passLength
                printf "\n"
                        if [[ -n $passLength ]] && [[ $passLength =~ ^[0-9]+$ ]] && [[ $passLength -ge 5 ]] && [[ $passLength -le 20 ]] ; then
                                return 0
                        fi
                echo "$(colorRed 'Incorrect length!') Give me numbers, bro." ; sleep 5
        done
}

askCount() {
        while true ; do
        read -p "How many passwords do u need? " passCount
        printf "\n"
                if [[ -n $passCount ]] && [[ $passCount =~ ^[0-9]+$ ]] && [[ $passCount -ge 1 ]] && [[ $passCount -le 50 ]] ; then
                        return 0
                fi
                echo "$(colorRed 'Incorrect count!') Try number between 1 and 50." ; sleep 5
        done
}

symbols() {
        while true ; do
                read -p "Can I use special symbols? " specSymbols
                printf "\n"
                        case $specSymbols in
                                yes|yup|y|yeah|sure|ok) return 0 ;;
                                no|nope|n|ne|net) return 1 ;;
                                *) echo "$(colorRed 'Incorrect input!') Try <yes> or <no>." ; sleep 5 ;;
                        esac
        done
}

generator() {
        local length=$1
        local useSymbols=$2
        if [[ $useSymbols -eq 0 ]] ; then
                        echo -ne "-> " ; tr -dc 'A-Za-z0-9!@#$%^&?*_' < /dev/urandom | head -c $length ;
                        echo
        else
                        echo -ne "-> " ; tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $length ;
                        echo
        fi
}

main() {
        greetings
        askLength
        askCount
        if symbols ; then
                useSymbols=0
        else
                useSymbols=1
        fi
                echo -n "Password generator started, please wait"
                        sleep 1
                echo -n "."
                        sleep 1
                echo -n "."
                        sleep 1
                echo -n "."
                        sleep 2
                echo ""
                echo "$(colorGreen 'Passwords generated successfully!')" ;
        for ((i = 0 ; i < $passCount ; i++)) ;
        do
                generator "$passLength" "$useSymbols"
        done

        echo "$(colorGreen 'Done!')"
}

main
