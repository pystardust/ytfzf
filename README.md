<p align="center">
    <a> <img src=.assets/logo.png></a>
    <br />
    <br />
	<a href="https://github.com/pystardust/ytfzf/stargazers"><img src="https://img.shields.io/github/stars/pystardust/ytfzf?color=orange&logo=github&style=flat-square"></a>
	<a href="https://github.com/pystardust/ytfzf/graphs/contributors"><img src="https://img.shields.io/github/contributors/pystardust/ytfzf?style=flat-square"></a>
	<a href="https://github.com/pystardust/ytfzf/releases/tag/v1.0.0"><img src="https://img.shields.io/github/v/tag/pystardust/ytfzf?style=flat-square"> </a>
	<a href="https://github.com/pystardust/ytfzf/commits/master"><img src="https://img.shields.io/github/commit-activity/m/pystardust/ytfzf?color=green&style=flat-square"></a>
	<a href="https://discord.gg/TM4xy6J3"><img src="https://img.shields.io/discord/815609275644117022?color=yellow&logo=discord&style=flat-square" alt="Discord"></a>
    <br />
    <br />
    <i>A POSIX script that helps you find Youtube videos (without API) and opens/downloads them using mpv/youtube-dl</i>
	<hr>
</p>

<h2 align="center">
	This is a little showcase
</h2>
<p align="center">
<img src=.assets/ytfzf.gif width="100%">
</p>

<div style="float: left; width: 60%;">
<h2>Table of Contents</h2>
<ul>
<li><a href="#Dependencies"><code>Dependencies</code></a></li>
<li><a href="#Installation"><code>Installation</code></a></li>
<li><a href="#Usage-Instructions"><code>Usage instruction</code></a></li>
<li><a href="#Subscriptions"><code>Subscriptions</code></a></li>
<li><a href="#Examples"><code>Examples</code></a></li>
</ul>
</div>
<div style="float: right; width: 40%;">
<h2>Features</h2>
<ul>
<li>Subscriptions</li>
<li>Thumbnails</li>
<li>History</li>
<li>Download</li>
<li>Format selection</li>
<li>Queue multiple videos</li>
</ul>
</div>

## Dependencies

_Fzf is optional, you can use an external menu (like dmenu) with the `-D` option (no thumbnail support)._

* [`mpv`](https://github.com/mpv-player/mpv)
* [`youtube-dl`](https://github.com/ytdl-org/youtube-dl)
* [`jq`](https://github.com/stedolan/jq) - _to parse json_
* [`fzf`](https://github.com/junegunn/fzf) (Optional) - _for menu_
* [`ueberzug`](https://github.com/seebye/ueberzug) (Optional) - _for thumbnails_

> Thumbnails only work with `fzf` and `Ueberzug` as of now.

+ #### Arch based

	  sudo pacman -S jq mpv youtube-dl fzf

	> For thumbnails

	  sudo pacman -S ueberzug

+ #### Debian based

	  sudo apt install jq mpv youtube-dl fzf

	> For thumbnails

	  pip install ueberzug

	_Note youtube-dl is usually outdated in debian repos, I suggest getting it from  [youtube-dl github](https://github.com/ytdl-org/youtube-dl)_

+ #### MacOS

	  brew install jq mpv youtube-dl fzf

	_At the moment thumbnail previews aren't working on MacOS_


## Installation

#### Fast installation options


1. ##### Installation by direct download

	```sh
	sudo curl -L "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" -o /usr/bin/ytfzf
	sudo chmod +x /usr/bin/ytfzf
	```

   _MacOS users might need to change their installation path from  `/usr/bin/` to `/usr/local/bin/`_

2. ##### Arch users can install ytfzf from the [AUR](https://aur.archlinux.org/packages/ytfzf-git/)

	```
	yay -S ytfzf-git
	```

3. ##### Gentoo users can install ytfzf from the [nitratesky](https://github.com/VTimofeenko/nitratesky) overlay

	```
	eselect repository enable nitratesky
	emerge -a1 net-misc/ytfzf
	```

#### Installation by cloning the repository

```sh
git clone https://github.com/pystardust/ytfzf
cd ytfzf
```

+ **Install with the Makefile**

```sh
sudo make install
```

+ **Uninstall with the Makefile**

```sh
sudo make uninstall
```

## Usage-Instructions


```sh
ytfzf [Options] <search-query>
```

> To quit the script you can press `ESC` or `^C` in the video selection prompt.

_Configuration file: `~/.config/ytfzf/conf.sh`, [sample config](docs/conf.sh), setting can be tweaked here or you can export the variables shown blow._

+ ### Thumbnails

	_Showing thumbnails requires ueberzug (which works only on X11, not supported on Wayland and MacOS)_.

	```sh
	ytfzf -t <search-query>
	```

	> Thumbnails preview side could be changed to the right with `--preview-side=right`

+ ### History

	- Show history

		```sh
		ytfzf -H
		```

	- Clear history

		```sh
		ytfzf -x
		```

	- History file: `~/.cache/ytfzf/ytfzf_hst`

	> History is enabled by default. To turn it off you can export `YTFZF_HIST=0` or set it in the config file.

+ ### External menu

	Use the `-D` flag: To use external menu

	By default the external menu is set to `dmenu -i -l 30`. This can be changed to `rofi`

	```sh
	YTFZF_EXTMENU=' rofi -dmenu -fuzzy -width 1500'
	```

	> The width of external menu can be adjusted with `YTFZF_EXTMENU_LEN=220`.

+ ### Format-selection and download

	_Video format can be set as per [youtube-dl formatting](https://github.com/ytdl-org/youtube-dl#format-selection)._

	```sh
	YTFZF_PREF="22"	# 22 set a resolution of 720p
	```

	+ `-f`: To view and select available formats.
	+ `-m`: (audio-only) Only audio format (best audio)

	+ `-d`: (download) To **download** a video instead of playing it.

+ ### Multi-selection

   Multiple videos can be queued up using `fzf`'s auto multi-selection (tab). To traverse between selected videos use `<` and `>`.

+ ### Looping, Searches

	+ `-l` --> (loop) would prompt the video menu every time a video finishes. Press `ESC` or `^C` to exit loop.
	+ `-s` --> (search-again) would ask for another search query as the video ends.

+ ### Auto and random selection

   To select videos *without video prompt*, if multiple videos are selected then they would play one after the other. The variable **n** represents the link count. Which is 1 by default.

	+ `-A`: (select-all) selects all the videos.
	+ `-a`: (auto-selection) selects the first **n**(=1) result.
	+ `-r`: (auto-selection) Randomly selects **n**(=1) results (shuffles them).
	+ `-n <number>` : (link-count) Set **n** the number of links to be selected.

+ ### Custom Player

	_By default, `ytfzf` uses `mpv`. Custom player should have the ability to launch youtube links (example: `vlc`)._

	```sh
	# example: using devour
	FZF_PLAYER="devour mpv"
	YTFZF_PLAYER_FORMAT="devour mpv --ytdl-format="
	```

+ ### Misc

	- The currently playing video details are stored in `~/.cache/ytfzf/ytfzf_cur` (for status bar modules)
	- Files and directories used by ytfzf can be set in the config file

	```sh
	cache_dir="$HOME/.cache/ytfzf"
	history_file="$YTFZF_CACHE/ytfzf_hst"
	current_file="$YTFZF_CACHE/ytfzf_cur"
	thumb_dir="$YTFZF_CACHE/thumb"
	```

	#### Useful mpv key bindings

	- `f`    :  full screen
	- `j`,`J`:  cycle subtitles (also works with audio, if the music video has subtitles)
	- `L`    :  single-loop


## Subscriptions

Subscriptions are managed in subscription file: `~/.config/ytfzf/subscriptions`.

+ #### Adding a certain channel to subscriptions

- Open the page of the channel you are interested in on a browser and go to the videos tab (located right below the channel name and subscription count).
- Copy the url of videos page. And add it to your subscription file.
- The url for each subscription must be on a separate line.

**_The subscription file needs to have only the channels' video page url. Comments can be added with `#`_**

```
# file : ~/.config/ytfzf/subscriptions
## tech channels
https://www.youtube.com/c/LukeSmithxyz/videos                   # luke smith
https://www.youtube.com/channel/UCngn7SVujlvskHRvRKc1cTw/videos # bugswriter
https://www.youtube.com/c/DistroTube/videos                     # distrotube
https://www.youtube.com/c/MentalOutlaw/videos                   # mental outlaw
```

**_To see subscriptions' latest videos_**

```sh
# Defaults to 10 results from each channel
ytfzf -S

# To show 15 results instead
ytfzf --subs=15
```

**_This can be combined with other options like thumbnails_**

```sh
ytfzf -tS
```

## Examples
+  Search with Thumbnails

	> Find and watch videos with thumbnail previews

       ytfzf -t <query>

	> Show all subscriptions with thumbnails (latest 10)

       ytfzf -St

+  You can use multiple options together, here are some examples

	- Stream audio (music), and prompt as the music finishes

		  ytfzf -ml <query>

	- Download a video from your history

	      ytfzf -dH

	- Open using external menu in a certain format

	 	  ytfzf -fD

+ _If you started watching a video and you wish to change format then
first hit Q to save position and quit mpv, then choose your format using_

	  ytfzf -faH

## Update Log

* We have now added Subscriptions which allows you to search between videos of subscribed channels easily
* Now ytfzf can queue videos using fzf multiselect option. Press tab to select a video. All the videos will be lined up in mpv. Use `>` and `<` to traverse them.
* Make continuous queries with `-s`
* You can preview video thumbnails now! Using Ueberzug. Inspired by [`fontpreview-ueberzug`](https://github.com/OliverLew/fontpreview-ueberzug).
* Stdin can be taken by using `ytfzf -`, for both fzf and external menu.
* Added MacOS support


## Todo 📝

* [ ] Playlists
* [ ] More sites
* [x] Subscriptions
* [x] Thumbnails

## Bugs ❌

* _dwm with swallow patch: Images don't render when looped (ie, option -l)_
- _If thubnails are not working `.Xautority` might be causing it. Try deleting `.Xauthority` and relogging._
