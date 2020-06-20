Exercises

1 - Create a new directory called ```missing``` under ```/tmp```.   
OK

2 - Look up the touch program. The ```man``` program is your friend.   
OK

3 - Use touch to create a new file called ```semester``` in ```missing```.   
OK

4 - Write the following into that file, one line at a time:

    ```
    #!/bin/sh
    curl --head --silent https://missing.csail.mit.edu
    ```
The first line might be tricky to get working. It’s helpful to know that ```#``` starts a comment in Bash, and ```!``` has a special meaning even within double-quoted (") strings. Bash treats single-quoted strings (```'```) differently: they will do the trick in this case. See the Bash ```quoting``` manual page for more information.

Solution:
```
missing$ touch semester
missing$ echo '#!/bin/sh' >> semester
missing$ echo 'curl --head --silent https://missing.csail.mit.edu' >> semester
```

5 - Try to execute the file, i.e. type the path to the script (```./semester```) into your shell and press enter. Understand why it doesn’t work by consulting the output of ```ls``` (hint: look at the permission bits of the file).

Solution:
```
$ ./semester
zsh: permission denied: ./semester

$ ls -l 
-rw-rw-r-- 1 w w 61 Jun 20 08:56 semester
```

6 - Run the command by explicitly starting the ```sh``` interpreter, and giving it the file ```semester``` as the first argument, i.e. ```sh semester```. Why does this work, while ```./semester``` didn’t?

Solution:
```
$ ./semester
zsh: permission denied: ./semester

$ ls -l semester
-rw-rw-r-- 1 w w 61 Jun 20 08:56 semester

$ getfacl semester
# file: semester
# owner: w
# group: w
user::rw-
group::rw-
other::r--

https://unix.stackexchange.com/questions/136547/what-is-the-difference-between-running-bash-script-sh-and-script-sh?rq=1

./semester requeres execution and readable bit, the current owner has only read, so it doesn't work, while sh semester only requires readable bit.

sh script.sh invokes the script directly using the shell.
./semester is using the shebang #!/bin/sh to determine how to execute.
```

7 - Look up the chmod program (e.g. use man chmod).

Solution:
```
$ man chmod
chmod - change file mode bits
```

8 - Use chmod to make it possible to run the command ./semester rather than having to type sh semester. How does your shell know that the file is supposed to be interpreted using sh? See this page on the shebang line for more information.

Solution:
```
$ chmod +x semester

https://en.wikipedia.org/wiki/Shebang_(Unix)
In computing, a shebang is the character sequence consisting of the characters number sign and exclamation mark (#!) at the beginning of a script.

When a text file with a shebang is used as if it is an executable in a Unix-like operating system, the program loader mechanism parses the rest of the file's initial line as an interpreter directive. The loader executes the specified interpreter program, passing to it as an argument the path that was initially used when attempting to run the script, so that the program may use the file as input data.[8] For example, if a script is named with the path path/to/script, and it starts with the following line, #!/bin/sh, then the program loader is instructed to run the program /bin/sh, passing path/to/script as the first argument. In Linux, this behavior is the result of both kernel and user-space code.
```

9 - Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory.

Solution:
```
./semester | grep 'last-modified' > ~/last-modified.txt
```

10 - Write a command that reads out your laptop battery’s power level or your desktop machine’s CPU temperature from /sys. Note: if you’re a macOS user, your OS doesn’t have sysfs, so you can skip this exercise.

Solution
```
$ cat /sys/class/thermal/thermal_zone0/temp
```