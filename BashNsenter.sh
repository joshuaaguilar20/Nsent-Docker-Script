#!/bin/bash

function usage () {

	echo ""
	echo  "Usage:"
	echo "$0  [-h] [<containerid>]"
	echo "if containterid is not supplied, latest run container id is used"
	echo ""
	echo "-h : display this message"
	exit 1;
}

if [ "$1" == "-h" ]; then 
	usage
fi

id=$1
if [ "x$1" == "x" ]; then 
	id=$(docker ps -lq)
fi
	

nsenter -t $(docker inspect --format '{{ .State.Pid }}' $id) -m -u -i -n -p -w
