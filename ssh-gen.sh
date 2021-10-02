#!/bin/bash

# clears the console for run this script
clear

# echo some info about the script like its pid, the name and what is for
echo "\n🚀 running $0 script \n🔎 PID: $$ \n🔐 for generate an ssh key in github."

# reads the email from cli imput and store as a variable
# inside varEmail for use to generate a  github ssh key later.
read -p "insert your github account email: " varEmail

clear

# reads an confirmation imput y,yes,n,no to confirm the email before
# use it to generate a ssh key.
read -p "do you confirm your email? \"$varEmail\" [y/n] " varEmailConfirmation

# get the varEmailConfirmation to upper casen
varEmailConfirmation=$(echo $varEmailConfirmation | tr 'a-z' 'A-Z')
echo \[$varEmailConfirmation\]

if [[ $varEmailConfirmation != "Y" ]]
then
	echo "run it again to re-enter your email." 
	exit 1
else
	echo "getting ssh key..."
	ssh-keygen -t ed25519 -C "$varEmail"
	echo "\n📎 copying to clipboard..."
	cat /Users/$USER/.ssh/id_ed25519.pub | pbcopy
	echo "\n 🚀 now your're ready to go 🚀\n"
	exit 0
fi
