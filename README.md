# ytfzf

A posix script that helps you find youtube videos (with out API) and opens/downloads using mpv/youtube-dl.
* History support
* Download support
* Format selection

Initially this used to be a single line script. But for portability and extensibility I am breaking my vow. If you still are here for the memes then use the line below.

	#!/bin/sh
	[ -z "$*" ] || curl "https://www.youtube.com/results" -s -G --data-urlencode "search_query=$*" |  pup 'script' | grep  "^ *var ytInitialData" | sed 's/^[^=]*=//g;s/;$//' | jq '..|.videoRenderer?' | sed '/^null$/d' | jq '.title.runs[0].text,.longBylineText.runs[0].text,.shortViewCountText.simpleText,.lengthText.simpleText,.publishedTimeText.simpleText,.videoId'| sed 's/^"//;s/"$//;s/\\"//g' | sed -E -n "s/(.{60}).*/\1/;N;s/\n(.{30}).*/\n\1/;N;N;N;N;s/\n/\t|/g;p" | column -t  -s "$(printf "\t")" | fzf --delimiter='\|' --nth=1,2  | sed -E 's_.*\|([^|]*)$_https://www.youtube.com/watch?v=\1_' | xargs -r -I'{}' mpv {}

# Usage

![Gif](ytfzf.gif)

	Usage: ytfzf <search query>
	     -h                    Show this help text
	     -H                    Choose from history
         -D                    Delete history
	     -m  <search query>    Audio only (for listening to music)
	     -d  <search query>    Download to current directory
	     -f  <search query>    Show available formats before proceeding


* Video to be selected using fzf.
* Searches based on title and channel names.

## Examples
> Watch video

	ytfzf <query>
	
* You can use multiple options together, here are some examples

> Steam audio (music)

	ytfzf -m <query>

> Download a video from your history

	ytfzf -dH

> Download a video in a certain format

	ytfzf -fd  <query>

If you started watching a video and you wish to change format then 
first hit Q to save position and quit mpv, then choose your format using

	ytfzf -fH


# Dependencies
* mpv
* [youtube-dl](https://github.com/ytdl-org/youtube-dl)
* [fzf](https://github.com/junegunn/fzf) - for menu
* [jq](https://github.com/stedolan/jq) - to parse json

### Arch based

	sudo pacman -S jq mpv youtube-dl fzf 

### Debian based

	sudo apt install jq mpv youtube-dl fzf 

> Note youtube-dl is usually outdated in debian repos, I suggest getting it from 

* [youtube-dl github](https://github.com/ytdl-org/youtube-dl)

# Installation

	git clone https://github.com/pystardust/ytfzf
	cd ytfzf
	chmod +x ytfzf

Copy it to your path
	
	sudo cp ytfzf /usr/local/bin/

Arch users can install ytfzf from the [AUR](https://aur.archlinux.org/packages/ytfzf-git/)
	
	yay -S ytfzf-git
        

# Todo

* Fix the char encoding. (Without pup)
* Playlists
* Icons
