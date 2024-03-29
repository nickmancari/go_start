#!/bin/bash
# Constants
BLUE="\e[34m"
NC="\e[39m"
RED="\e[31m"
LBLUE="\e[44m"
NB="\e[49m"
PUSH="                         "

# setup enviroment for Golang
#
#----Check Enviroment----

# testing sudo requirement 
# may not be needed in new script versions
#whoami | grep 'root' &> /dev/null
#	if [[ $? != 0 ]]; then
#		echo -e "${RED}Error${NC}: root required" && return 1
#	else 
#		:
#	fi 
	
wget -q --spider google.com
	if [[ $? != 0 ]] ; then
		echo -e "${RED}Error${NC}: wget not installed" && return 1
	else 
		:
	fi

find /usr/local/go &> /dev/null
	if [[ $? == 0 ]]; then
		echo -e "${RED}Error${NC}: go is already installed. Run version check instead." && return 1
	else
		:
	fi

#----Done Enviroment Check
#
#---Check for latest version of GO

function scrape() {
	wget -q https://golang.org/dl/ -O - | grep 'downloadBox.*linux' > tmp_file && cut tmp_file -d '"' -f 4
}

GODOWNLOAD=$(echo -e $(scrape) | cut -c 5-)

#---Done Checking Lastest Version
#
#---Run main body of script
wget https://golang.org/dl/${GODOWNLOAD} -P ~/ &&
echo -e "${PUSH}${BLUE}You just downloaded ${GODOWNLOAD}${NC}"
tar -C /usr/local -xzf ~/${GODOWNLOAD} &&
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile && . /etc/profile &&
go run $PWD/test_go.go
#
#----Clean up------
#
rm -rf $PWD/tmp_file
rm -rf ~/${GODOWNLOAD}
#
# <-------Need further testing for items below this----->

# echo "Setting up VIM plugin"
#	git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
# echo -e "VIM Plugin is setup! You ${LBLUE}GO${NB}!"

