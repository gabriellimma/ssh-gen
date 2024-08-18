#!/bin/bash

# clears the console for run this script
clear

# echo some info about the script like its pid, the name and what is for
printf "\n🚀 running %s script \n🔎 PID: %d \n🔐 this script will generate an ssh key in your machine to authenticate you on GitHub.\n" "$0" "$$"
# reads the email from cli imput and store as a variable
# inside varEmail for use to generate a  github ssh key later.
read -r -p "please, insert your github account email: " varEmail

clear

# reads an confirmation imput y,yes,n,no to confirm the email before
# use it to generate a ssh key.
read -r -p "do you confirm your email? \"$varEmail\" [y/n] " varEmailConfirmation

# get the varEmailConfirmation to upper casen
varEmailConfirmation=$(printf "%s" "$varEmailConfirmation" | tr '[:lower:]' '[:upper:]')
printf "[%s]" "$varEmailConfirmation"

if [[ $varEmailConfirmation != "Y" ]]
then
	printf "\nrun it again to re-enter your email." 
	exit 1
else
	printf "\ngetting ssh key..."
	ssh-keygen -t ed25519 -C "$varEmail"
	printf "\n📎 copying to clipboard..."
	pbcopy < /Users/"$USER"/.ssh/id_ed25519.pub
	printf "\n 🚀 now your're ready to go 🚀\n"
	printf '\e]8;;https://github.com/settings/ssh/new\e\\access your github account and paste the key in the ssh key section.(CMD + Click)\e]8;;\e\\\n'
	exit 0
fi
