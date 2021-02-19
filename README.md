# ytfzf
A one line script that help you find youtube videos.

![Gif](ytfzf.gif)

# Usage
```
ytfzf  <search query>
```
Select the video using fzf. 
It will search based on title and uploader names.

## Dependencies
* mpv
* [youtube-dl](https://github.com/ytdl-org/youtube-dl)
* [fzf](https://github.com/junegunn/fzf) - for menu
* [jq](https://github.com/stedolan/jq) - to parse json
* [pup](https://github.com/ericchiang/pup) - to parse html
* xargs

## To install Dependencies

### Arch based

	pacman -S jq mpv fzf 
> from AUR

	yay -S pup

# Installation
Once you have all the dependencies

	git clone https://github.com/pystardust/ytfzf
	cd ytfzf
	chmod +x ytfzf

Then you can move it to your path (optional)
	
	sudo mv ytfzf /usr/local/bin/ytfzf
