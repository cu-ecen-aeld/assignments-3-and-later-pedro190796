#!/bin/bash

writefile=$1
writestr=$2

# Check if statements are empty

if [ -z "$writefile" ] || [ -z "$writestr" ]
then
       echo "Error: Two arguments must be specified"
       exit 1
fi

# Check if filesdir represent a directory on the filesystem

if [ ! -d "$writefile" ]
then
	mkdir -p $(dirname "$writefile")	
fi	

#Create and write on file

echo "$writestr" > "$writefile"

# Check if the file was created

if [ ! -e "$writefile" ]
then
	echo "Error: file could not be created"
	exit 1
fi
