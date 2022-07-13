# Contributing

* use the development branch
* Keep the script POSIX compliant as defined [here](https://pubs.opengroup.org/onlinepubs/9699919799/)
    * Exceptions may be made if there is a backup POSIX function defined, for example, the `shuf` utility is used, and there is a backup `shuf` function defined if the user does not have `shuf` installed.
    * If something is not POSIX it may only be implemented if it is available on many systems (Linux, and BSD), and it's impractical to implement in POSIX shell.
	* For example: `date -d` is used.

* Feel free to give yourself a file in the `credits` folder, and add yourself to the table in the README :)


# Shells

A non-comprehensive list of shells to test the script with

* bash
* dash
* ksh
* bsd-ksh (on the aur this is the package oksh)
* busybox sh
* any other posix shells
* zsh*

*Technically zsh does not have to work because it's not posix compliant, but zsh should work at least some what.
