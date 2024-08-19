#! /bin/bash

filesdir=$1
searchstr=$2

if [ -z "$filesdir" ] || [ -z "$searchstr" ]
then
	echo "Error: parameter missing"
	echo "Usage: ./finder.sh [filesdir] [searchstr]"
	exit 1
fi

if [ ! -d "$filesdir" ]
then
	echo "Error: filesdir parameter is not a directory"
	exit 1
fi

f_count=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines containing 'searchstr' in those files
lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result
echo "The number of files are $f_count and the number of matching lines are $lines"

