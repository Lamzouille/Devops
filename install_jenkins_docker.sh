#!/bin/bash

# @version 1.0
# @author Sylvain THIRARD

# Check prerequisities

f_logMsg(){

	level=$1
	msg=$2

	RED="\033[31m"
	GREEN="\033[32m"
	YELLOW="\033[33m"
	BLUE="\033[34m"
	BLACK="\033[30m"
	DELIM_FIN="\033[m"
	_date=$(date '+%d/%m/%Y - %T')


	if [ $level == "ERROR" ]; then
		COLOR="${RED}"
	elif [ $level == "DEBUG" ]; then
		COLOR="${BLUE}"
	elif [ $level == "SUCCESS" ]; then
		COLOR="${GREEN}"
	elif [ $level == "WARNING" ]; then
		COLOR="${YELLOW}"
	else COLOR="${WHITE}"
	fi

	echo -e "${COLOR}""["$level"] [${_date}] - ""${msg}""${DELIM_FIN}"
}

# Check if docker is installed
test_cmd=$(which docker)

if [ "${test_cmd}" == "" ];
then
  f_logMsg ERROR "Docker must be installed ..."
  # Downloading  
  apt install docker 
  apt install docker-compose
fi
  
