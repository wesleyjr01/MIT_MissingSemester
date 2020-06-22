#!/bin/bash

# Start file with first row equals 0
echo 0 > finderror.txt

while [ "$(cat finderror.txt | tail -n1)" -eq 0 ]; do

    n=$(( RANDOM % 100 ))

    if [[ n -eq 42 ]]
    then
        echo 1 >> finderror.txt
    else
        echo 0 >> finderror.txt
    fi
done