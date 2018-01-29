#!/bin/bash
#=========================================#
# Script:	 start_automation.sh      #
# Author:        Scott Frasier            #
# Date Created:  28/01/2017               #
# Last Modified: 28/01/2017               #
# Purpose:                                #
# Starts the virtualenv and the starts    #
# the browser automation.             	  #
#=========================================#


start_automation () {
	# Start the virtualenv
	cd ~/Documents/instapy_automation/
	source venv/bin/activate
	# Start the automation script 
	cd InstaPy
	time python your_automation.py
}


start_automation
