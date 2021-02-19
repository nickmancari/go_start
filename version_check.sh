#!/bin/bash

VERSION=$(go version | grep 'go1' > check_tmp_file && cut -b 16-17 check_tmp_file)

function update() {
	rm -rvf /usr/local/go && $PWD/go_setup.sh	
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
	$(check) && rm -rf check_tmp_file
fi
