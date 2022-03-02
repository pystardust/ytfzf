# Contributing

* branch2 commit3
* Keep the script POSIX compliant as defined [here](https://pubs.opengroup.org/onlinepubs/9699919799/)
    * Exceptions may be made if there is a backup POSIX function defined, for example, the `shuf` utility is used, and there is a backup `shuf` function defined if the user does not have `shuf` installed.
    * If something is not POSIX it may only be implemented if it is available on many systems (Linux, and BSD), and it's impractical to implement in POSIX shell.
	* For example: `date -d` is used.

* Feel free to give yourself a file in the `credits` folder, and add yourself to the table in the README :)
