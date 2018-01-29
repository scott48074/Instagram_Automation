#!/bin/bash
#=========================================#
# Script:	 install_instapy.sh       #
# Author:        Scott Frasier            #
# Date Created:  28/01/2017               #
# Last Modified: 28/01/2017               #
# Purpose:                                #
#  1) Install InstaPy 		          #
#  2) Download the Chrome Driver          #
#  3) Install InstaPy requirements into a #
#     virtualenv                          #
# This script assumes that you python3    #
# python virtualenv, and pip installed    #
#=========================================#


delete_old () {
	# If InstaPy is present delete
	if [ -d ~/Documents/instapy_automation ]; then
		echo "Deleting old directory"
		rm -r ~/Documents/instapy_automation
fi
}


get_new () {
	# Download latest version of InstayPy
	echo "Updating InstaPy"
 	mkdir ~/Documents/instapy_automation
 	cd ~/Documents/instapy_automation
 	git clone https://github.com/timgrossmann/InstaPy.git
}


make_virtual_env () {
	# Make and activate virtualenv
	echo "Making Virtual env and installing selenium"
	cd ~/Documents/instapy_automation
	virtualenv venv
	source venv/bin/activate
}


download_chrome_driver() {
	# Download the Chrome Driver and move to appropriate directory
	echo "Downloading Chrome Driver"
	mkdir ~/Documents/my_tmp
	cd ~/Documents/my_tmp
	wget https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip
	unzip chromedriver_linux64.zip
	mv chromedriver ~/Documents/instapy_automation/InstaPy/assets/
	rm -r ~/Documents/my_tmp
}


remove_language_check (){
	# WARNING: if your Chrome Browser's default language is not English 
	# do not call this function. This deletes code that causes a hang 
	# may need to be removed later. 
	cd ~/Documents/instapy_automation/InstaPy/instapy
	sed -i '113,118d;' login_util.py
}


run_instapy_setup () {
	# Install InstayPy requirements into the virtualenv
	cd ~/Documents/instapy_automation
	source venv/bin/activate
	cd InstaPy
	pip install .
}


delete_old
get_new
make_virtual_env
download_chrome_driver
remove_language_check # Remove if Chrome's default language is not English. 
run_instapy_setup
