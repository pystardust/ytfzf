# ytfzf
A POSIX script that helps you find youtube videos (with out API) and opens/downloads using mpv/youtube-dl.
* History support
* Download support
* Format selection ( with feature to choose default option )

Initially this used to be a single line script. But for portability and extensibility I am breaking my vow. If you still are here for the memes then use the line below.

	#!/bin/sh
	[ -z "$*" ] || curl "https://www.youtube.com/results" -s -G --data-urlencode "search_query=$*" |  pup 'script' | grep  "^ *var ytInitialData" | sed 's/^[^=]*=//g;s/;$//' | jq '..|.videoRenderer?' | sed '/^null$/d' | jq '.title.runs[0].text,.longBylineText.runs[0].text,.shortViewCountText.simpleText,.lengthText.simpleText,.publishedTimeText.simpleText,.videoId'| sed 's/^"//;s/"$//;s/\\"//g' | sed -E -n "s/(.{60}).*/\1/;N;s/\n(.{30}).*/\n\1/;N;N;N;N;s/\n/\t|/g;p" | column -t  -s "$(printf "\t")" | fzf --delimiter='\|' --nth=1,2  | sed -E 's_.*\|([^|]*)$_https://www.youtube.com/watch?v=\1_' | xargs -r -I'{}' mpv {}

# Usage

![Gif](ytfzf.gif)

	Usage: ytfzf <search query>
	     -h                    Show this help text
	     -H                    Choose from history
	     -m  <search query>    Audio only (for listening to music)
	     -d  <search query>    Download to current directory
	     -f  <search query>    Show available formats before proceeding


Select the video using fzf. 
It will search based on title and channel names.

## Examples
> Watch Youtube videos ( Default format : best video )

	ytfzf <query>
	
> Download audio (music)

	ytfzf -dm <query>

> Download a video in your history

	ytfzf -dH

> Watch a video in your history in a different format

	ytfzf -fH

> Download a video in a certain format

	ytfzf -fd


If you started watching a video and you wish to change format then first hit Q to save position and quit mpv, then choose your format using

	ytfzf -fH



## Dependencies
* mpv
* [youtube-dl](https://github.com/ytdl-org/youtube-dl)
* [fzf](https://github.com/junegunn/fzf) - for menu
* [jq](https://github.com/stedolan/jq) - to parse json
* xargs

## To install Dependencies

### Arch based

	pacman -S jq mpv youtube-dl fzf 

# Installation
Once you have all the dependencies

	git clone https://github.com/pystardust/ytfzf
	cd ytfzf
	chmod +x ytfzf

Then you can move it to your path (optional)
	
	sudo mv ytfzf /usr/local/bin/ytfzf

# Todo

* Fix the char encoding. (Without pup)
* Playlists
