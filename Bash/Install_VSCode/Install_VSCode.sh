#!/bin/bash
# Run Using 'bash ./Intall_VSCode.sh'

# Setup
mkdir ~/bin 2> /dev/null

# Input
printf "Which version matches your current machine?\n"
printf "[1] 64-bit\n"
printf "[2] ARM 32-bit\n"
printf "[3] ARM 64-bit\n"
printf ">"
read osver
printf "\n"

# Download
if [ $osver == 1 ]; then
	printf "Downloading VSCode 64-bit for Linux\n\n"
	wget -O ~/bin/vscode.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
elif [ $osver == 2 ]; then
	printf "Downloading VSCode ARM 32-bit for Linux\n\n"
	wget -O ~/bin/vscode.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-armhf"
elif [ $osver == 3 ]; then
	printf "Downloading VSCode ARM 64-bit for Linux\n\n"
	wget -O ~/bin/vscode.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-arm64"
else
	printf "Invalid selection, exiting\n"
	exit
fi

# Extract
printf "\nExtracting...\n"
tar -xf ~/bin/vscode.tar.gz -C ~/bin

# Link
printf "\nSetting up...\n"
rm -r ~/bin/code 2> /dev/null
ln -s ~/bin/VSCode*/bin/code ~/bin/

# Cleanup
printf "Cleaning up...\n"
rm -r ~/bin/vscode.tar.gz

# Exit
printf "\n\nINSTALL COMPLETE (~/bin/)\n"
printf "Use 'code' to launch vs code (~/bin/ may need to be added to \$PATH)\n"
