#!/bin/bash

# Alex Anderson (c) 2016, public domain

clear

# source .bashrc

# Go to home dir
# cd ~

if [ $TERM = "linux" ]
then 
	# Custom setup for tty
	~/.colors/setcolors ~/.colors/gruv
	setfont /usr/share/consolefonts/Lat7-Terminus16.psf.gz
	alias vim="vim"
else
	# Non-tty consoles
	# alias vim="nvim"
	:
fi

# Get name if first time use
if [ ! -e ~/.bash_profile_name ]
then
	echo -e "No file found at ~/.bash_profile_name \n"
	echo "What is your name?"
	echo -n "Enter it here: "
	read name
	echo $name > ~/.bash_profile_name
	echo $name + "has been stored! (~/.bash_profile_name"
	clear
	echo "Please restart this terminal for changes to take effect"
else
	# Text greeting
	echo -e "\e[37m$(date +%H:%M\ %b\ %e)\e[0m \e[91m\e[2m@\e[0m \e[37m$(uname) $(uname -r)\e[0m"
	echo -e "\e[1mWelcome back, \e[38;5;$((($RANDOM % 256) + 1))m$(cat ~/.bash_profile_name)!\e[0m"
	echo ""
	echo -e "\e[37mThe system has been \e[0m$(uptime -p)"
	echo ""
fi

# Aliases
alias cd..="cd .."
alias cd....="cd ../.."
alias sbp="source ~/.bash_profile"
alias greet='echo -en "\e[1mWelcome back, \e[38;5;$((($RANDOM % 256) + 1))m$(cat ~/.bash_profile_name)!\e[0m "'

# Arch specific aliases
alias aurget="aurget --nodiscard --builddir ~/Documents/clone"

# My favorite PS1 (Only works on bash)
export PS1="\[\033[38;5;6m\][\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;4m\]@\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;2m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;4m\]\\$\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
# Old favorite
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$

# System specific

function forever(){
	while true; do "$@"; done
}

alias rungo="DATABASE_USER=root DATABASE_HOST=localhost DATABASE_PASSWORD= go run src/*.go"

export GOPATH=~/go/

set -o vi

# xmodmap -e "clear lock" &> /dev/null
# xmodmap -e "keysym Caps_Lock = Escape" &> /dev/null

export GOCALC=~/go/src/github.com/appins/graphing
export SHINE=~/go/src/github.com/appins/shine

export EDITOR='vim'

alias python='python3'

alias susset='sudo vim /etc/systemd/logind.conf; sudo systemctl restart systemd-logind'

alias dockmodeon='killall light-locker; sudo cp ~/Documents/.docked-mode/logind-docked /etc/systemd/logind.conf; sudo systemctl restart systemd-logind; sh ~/Documents/.docked-mode/randr-docked.sh; i3-msg restart; sleep 1; killall light-locker; echo docked!; sleep 5; killall light-locker &> /dev/null'
alias dockmodeoff='sudo cp ~/Documents/.docked-mode/logind-undocked /etc/systemd/logind.conf; sudo systemctl restart systemd-logind; sh ~/Documents/.docked-mode/randr-undocked.sh; i3-msg restart; echo undocked!'
