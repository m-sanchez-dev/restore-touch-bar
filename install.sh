#!/usr/bin/env bash

printf "Let me install the script for you, it will only be one second\n"

printf " >>> Installation started\n"

printf "I need to make this executable\n"

# Make script executable just in case
chmod +x main.sh

# Get repository path
repository_folder=$(pwd)
printf "The script is being installed in: %s\n" "$repository_folder"

printf "Checking if the system uses zsh or bash \n"

if [ -z "$ZSH_VERSION" ]; then # Update just zsh
    echo "ZSH detected"
    printf " >>> Remove alias if exists\n"
    awk '!/alias restore-touch-bar/' ~/.zshrc > temp && mv temp ~/.zshrc

    printf " >>> Save restore-touch-bar alias\n\n"
    echo "alias restore-touch-bar='$repository_folder/main.sh'" >> ~/.zshrc
elif [ -z "$BASH_VERSION" ]; then # Update just bash
    echo "Bash detected"
    printf " >>> Remove alias if exists\n"
    awk '!/alias restore-touch-bar/' ~/.bashrc > temp && mv temp ~/.bashrc

    printf " >>> Save restore-touch-bar alias\n\n"
    echo "alias restore-touch-bar='$repository_folder/main.sh'" >> ~/.bashrc
else # Do both to secure that the installation is completed correctly
    echo "System could not be detected, modifying both files"
    printf " >>> Remove alias if exists\n"
    awk '!/alias restore-touch-bar/' ~/.bashrc > temp && mv temp ~/.bashrc
    awk '!/alias restore-touch-bar/' ~/.zshrc > temp && mv temp ~/.zshrc

    printf " >>> Save restore-touch-bar alias\n\n"
    echo "alias restore-touch-bar='$repository_folder/main.sh'" >> ~/.bashrc
    echo "alias restore-touch-bar='$repository_folder/main.sh'" >> ~/.zshrc
fi
printf " >>> Installation completed!\n\n"
printf "You can use the command by typing restore-touch-bar in the terminal\n"

printf "\nTo be able to use the command update the source of the terminal with:\n"
printf "     source ~/.zshrc \n"
printf "or\n"
printf "     source ~/.bashrc \n\n"