#!/bin/bash
# Nombre: run.sh
# Description: Initial Script that get permissions, prepare the system for the tool and launch main script (main.sh)
#############################

# Global Parameters
set -e # No errors allowed
ROOT="YES" # Root execution necessary (YES o NO)

#############################

# Check if the script has been execute with root privileges
if [ "$ROOT" == "YES" ]; then
	if [ "$(id -u)" != "0" ]; then # Check no root privileges. The command "id -u" return 0 if the user has root privileges
		$PWD/bashFiles/init/getRoot.sh # Run the script getRoot.sh to obtain root permission
	fi
fi

#############################

# Launch main script
bashFiles/main.sh