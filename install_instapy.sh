#!/bin/bash
#=========================================#
# Script:	 install_instapy.sh           #
# Author:        Scott Frasier            #
# Date Created:  28/01/2017               #
# Last Modified: 28/01/2017               #
# Purpose:                                #
#  1) Install InstaPy 		              #
#  2) Download the Chrome Driver          #
#  3) Install InstaPy requirements into a #
#     virtualenv                          #
# This script assumes that you python3    #
# python virtualenv, and pip installed    #
#=========================================#


delete_old () {
	# If InstaPy is present delete
	if [ -d $1/instapy_automation ]; then
		echo "Deleting old directory" >&2
		rm -r $1/instapy_automation
	fi
}


get_new () {
	# Download latest version of InstayPy
	echo "Updating InstaPy" >&2
 	mkdir $1/instapy_automation
 	cd $1/instapy_automation
 	git clone https://github.com/timgrossmann/InstaPy.git
}


make_virtual_env () {
	# Make and activate virtualenv
	echo "Making Virtual env and installing selenium" >&2
	cd $1/instapy_automation
	virtualenv venv
	source venv/bin/activate
}


download_chrome_driver() {
	# Download the Chrome Driver and move to appropriate directory
	echo "Downloading Chrome Driver" >&2
	mkdir $1/tmp
	cd $1/tmp
	wget https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip
	unzip chromedriver_linux64.zip
	mv chromedriver $1/instapy_automation/InstaPy/assets/
	rm -r $1/tmp
}



run_instapy_setup () {
	# Install InstayPy requirements into the virtualenv
	echo "Installing InstaPy" >&2
	cd $1/instapy_automation
	source venv/bin/activate
	cd InstaPy
	pip install .
}

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
delete_old $SCRIPTPATH
get_new $SCRIPTPATH
make_virtual_env $SCRIPTPATH
download_chrome_driver $SCRIPTPATH
run_instapy_setup $SCRIPTPATH
