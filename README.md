# ytfzf
A one line script that help you find youtube videos.

![Gif](ytfzf.gif)

# Usage
```
./ytfzf  <search query>
```
Select the video using fzf. 
It will search based on title and uploader names.

## Dependencies
* mpv
* fzf 
* jq
* pup
* xargs

# To install in arch based distors

	pacman -S jq mpv fzf 
> from AUR

	yay -S pup
