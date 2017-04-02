#!/usr/bin/bash

# Text color variables
underline=$(tput sgr 0 1)          # Underline
bold=$(tput bold)             # Bold
boldred=${bold}$(tput setaf 1) #  red
boldblue=${bold}$(tput setaf 4) #  blue
boldlimeyellow=${bold}$(tput setaf 190) #  lime yellow
boldgreen=${bold}$(tput setaf 2) # green
reset=$(tput sgr0)             # Reset

echo "${boldgreen}Welcome to the Compiler++ installer!${reset}"

echo "${bold}  CCCCCC  RRRRR        ++           ++${reset}"
echo "${bold} CC       R    R       ++           ++${reset}"
echo "${bold}CC        RRRRR    ++++++++++   ++++++++++${reset}"
echo "${bold} CC       R    R       ++           ++${reset}"
echo "${bold}  CCCCCC  R    R       ++           ++${reset}"

echo "${boldblue}Installing Homebrew...${reset}"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "${boldblue}Done!${reset}"
echo "${boldblue}Checking for problems...${reset}"
brew doctor
echo "${boldlimeyellow}Done!${reset}"

echo "${boldblue}Installing go with homebrew...${reset}"
brew install go --cross-compile-common

echo "${boldblue}Finished, now initalizing parts for gc...${reset}"
mkdir $HOME/go
export GOPATH=$HOME/go

open $HOME/.bash_profile

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

echo "${boldlimeyellow}Finished installing Go!${reset}"

echo "${boldblue}Installing Clisp with homebrew...${reset}"
brew install clisp
echo "${boldblue}Finished installing Clisp!${reset}"

echo "${boldblue}Installing mono with homebrew...${reset}"
brew install mono
echo "${boldblue}Finished installing mono!"

echo "${boldblue}Installing Fortran... (gfortran)"
echo "Downlaoding..."
curl "http://prdownloads.sourceforge.net/hpc/gfortran-6.3-bin.tar.gz" -o "gfortran-6.3-bin.tar.gz"
echo "Unzipping..."
gunzip gcc-6.2-bin.tar.gz
sudo tar -xvf gcc-6.2-bin.tar -C
echo "${boldblue}Finished installing Fortran!"

echo "${boldblue}Installing D...${reset}"
curl -fsS https://dlang.org/install.sh | bash -s dmd
echo "${boldblue}Finished installing D${reset}!"
