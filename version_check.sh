#!/bin/bash

VERSION=$(go version | grep 'go1' > tmp_file && cut -b 16-17 tmp_file)

function check() {
	if [[ $VERSION < 16 ]]; then
		echo -e "Your Version of Go is old" >&2
	else
		echo -e "Your version is fine" >&2
	fi
}

go version &> /dev/null
if [[ $? == 1 ]]; then
	echo -e "GO is not installed" && return
else
	$(check)
fi
