#!/bin/bash
#=========================================#
# Script:	 update_and_move.sh       #
# Author:        Scott Frasier            #
# Date Created:  28/01/2017               #
# Last Modified: 28/01/2017               #
# Purpose:                                #
# Downloads and moves the relevant files  #
# into the InstaPy directory to be        #
# consumed by the your_automation.py      #
# script.                                 #
#=========================================#


get_csv_files () {
	# Retrieve the CSV files from Google Drive.
	# ReadMe contains instructions
	wget -q -O $1 $2
}


copy_files () {
	# Copy the relevant files to the InstaPy directory.
	cp ~/Documents/Instagram_Automation/{config.json,followers.csv,your_automation.py,tags.csv,unwanted_tags.csv} ~/Documents/instapy_automation/InstaPy/
}


get_csv_files followers.csv $(cat config.json | jq .followers | tr '"' " ")
get_csv_files tags.csv $(cat config.json | jq .tags | tr '"' " ")
get_csv_files unwanted_tags.csv $(cat config.json | jq .unwanted_tags | tr '"' " ")
copy_files


