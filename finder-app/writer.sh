#!/bin/bash

writefile=$1
writestr=$2

if [ -z "$writefile" ] || [ -z "$writestr" ]
then
    echo "Error: missing parameters"
    echo "Usage: ./writer.sh writefile writestr"
    exit 1
fi

mkdir -p "$(dirname "$writefile")"

if ! echo "$writestr" > "$writefile"; then
    echo "Error: file could not be created"
    exit 1
fi

echo "Successfully wrote to $writefile"
