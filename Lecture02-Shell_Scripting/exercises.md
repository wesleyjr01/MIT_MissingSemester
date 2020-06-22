# Exercises
https://missing.csail.mit.edu/2020/shell-tools/

1) Read man ls and write an ls command that lists files in the following manner

    Includes all files, including hidden files
    Sizes are listed in human readable format (e.g. 454M instead of 454279954)
    Files are ordered by recency
    Output is colorized

Solution:
```
$ ls -la --block-size=k --sort=t 
```

2) Write bash functions ```marco``` and ```polo``` that do the following. Whenever you execute ```marco``` the current working directory should be saved in some manner, then when you execute ```polo```, no matter what directory you are in, ```polo``` should ```cd``` you back to the directory where you executed ```marco```. For ease of debugging you can write the code in a file ```marco.sh``` and (re)load the definitions to your shell by executing ```source marco.sh```.

Solution:
```
# marco.sh

marco (){
    foo="$(pwd)"
}

polo() {
    cd "$1"
}
```

3) Say you have a command that fails rarely. In order to debug it you need to capture its output but it can be time consuming to get a failure run. Write a bash script that runs the following script until it fails and captures its standard output and error streams to files and prints everything at the end. Bonus points if you can also report how many runs it took for the script to fail.

Solution:
```
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
```