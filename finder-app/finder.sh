#!/bin/sh

filesdir=$1
searchstr=$2

# Check if statements are empty

if [ -z "$filesdir" ] || [ -z "$searchstr" ]
then
	echo "Error: Two arguments must be specified"
	exit 1
fi

# Check if filesdir represent a directory on the filesystem

if [ ! -d "$filesdir" ]
then
	echo "Error: filesdir does not represent a directory on the filesystem"
	exit 1
else
	# Find the number of file in directory
	x=$(find "$filesdir" -type f | wc -l)
	# Find the number  of str in file
	y=$(grep -r "$searchstr" "$filesdir" | wc -l)
	echo "The number of files are $x and the number of matching lines are $y"
fi


