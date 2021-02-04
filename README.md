<p align='center'> GO setup script for Linux Enviroment. </p>

# Instructions:
Download the repository:
```
$ git clone https://github.com/nickmancari/go_start.git
```
`cd` into the `go_start` directory

Run the `go_setup.sh` bash script:
```
$ sudo ./go_start.sh
```
## What Happens:
* The script searches for the latest version of GO and downloads it directly from `golang.org`
* It installs GO in one easy and quick process
* It sets up the GOPATH
* It tests the installation by running a quick GO program (`test_go.go`) with color

### Optional:
* You can uncomment the bottom portion of the script to have the setup script install the vim-go plugin for VIM

#### New to Come:
* Script will check the enviroment to see if GO is already installed and, if so, check the verison and do an update if necessary.
