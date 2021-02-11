#!/bin/bash

VERSION=$(go version | grep 'go1' > tmp_file1 && cut -b 16-17 tmp_file1)

function update() {
	sudo rm -rvf /usr/local/go && $PWD/go_setup.sh	
}

function check() {
	if [[ $VERSION < 15 ]]; then
		echo -e "Your Version of Go is old" >&2 && $(update)
	else
		echo -e "Your version is up to date" >&2
	fi
}

go version &> /dev/null
if [[ $? == 1 ]]; then
	echo -e "GO is not installed" && return
else
	$(check)
fi

rm -rf $PWD/tmp_file1
