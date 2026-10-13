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

main() {
clear

echo -ne "| Hi! Welcome to my simple password generator based on /dev/urandom. |"
printf "\n"
echo "----------------------------------------------------------------------"
printf "\n"
read -p "Here we go? " go
if ! [[ $go =~ ^(yes|y|yup|yeah|start!|go)$ ]] ; then
        echo "$(colorRed 'Bye!')" ; exit 1
fi

printf "\n"
read -p "Enter password length (5 - 20 symbols): " passLength
printf "\n"

if [[ -n $passLength ]] && [[ $passLength -ge 5 ]] && [[ $passLength -le 20 ]] ; then
        read -p "How many passwords do u need? " passCount
        printf "\n"
        if [[ $passCount -lt 1 ]]
        then
                echo "$(colorRed 'Quantity cant be < 1, try again ')" ; sleep 8 ; main
        elif [[ $passCount -gt 50 ]]
        then
                echo "Do u really need that much? Huh?!" ; sleep 8 ; main
        fi
        read -p "Can I use special symbols? " specSymbols
        printf "\n"
                case $specSymbols in
                        yes | yup | y | yeah | sure | "damn yes" | ok | da | 1)
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
                                for ((i = 0 ; i < $passCount ; i++))
                                do
                                tr -dc 'A-Za-z0-9!@#$%^&?*_' < /dev/urandom | head -c $passLength ;
                                echo
                                done ;;
                        no | not | net | ne | n | nope | 2)
                                echo -n "Passwords generator started, please wait"
                                sleep 1
                                echo -n "."
                                sleep 1
                                echo -n "."
                                sleep 1
                                echo -n "."
                                sleep 2
                                echo ""
                                echo "$(colorGreen 'Password generated successfully!') " ;
                                for ((i = 0 ; i < $passCount ; i++))
                                do
                                tr -dc 'A-Za-z0-9' < /dev/urandom | head -c $passLength ;
                                echo
                                done ;;
                        *) echo "$(colorRed 'Incorret input, try <yes> or <no> instead') "; sleep 5 ; main ;;
                esac
else
        echo $(colorRed 'Incorrect length!') ; sleep 8 ; main
fi
}

main
