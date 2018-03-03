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
	cp $1/{config.json,followers.csv,your_automation.py,tags.csv,unwanted_tags.csv} $1/instapy_automation/InstaPy/
}

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
get_csv_files $SCRIPTPATH/followers.csv $(cat $SCRIPTPATH/config.json | jq .followers | tr '"' " ")
get_csv_files $SCRIPTPATH/tags.csv $(cat $SCRIPTPATH/config.json | jq .tags | tr '"' " ")
get_csv_files $SCRIPTPATH/unwanted_tags.csv $(cat $SCRIPTPATH/config.json | jq .unwanted_tags | tr '"' " ")

echo "followers.csv has $( wc -l $SCRIPTPATH/followers.csv | awk '{print $1}') lines"
echo "tags.csv has $(wc -l $SCRIPTPATH/tags.csv | awk '{print $1}') lines" 
echo "unwanted_tags.csv has $(wc -l $SCRIPTPATH/unwanted_tags.csv | awk '{print $1}') lines" 
copy_files $SCRIPTPATH

