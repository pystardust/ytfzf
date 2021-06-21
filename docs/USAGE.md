# Usage-Instructions

```sh
ytfzf [Options] <search-query>
```

> To quit the script you can press `ESC` or `^C` in the video selection prompt.

## Configurations

_You can create a configuration file to manage the different value instead of exporting them._


**The configuration file should be:**

```
~/.config/ytfzf/conf.sh
```

If you wish to find inspiration and see an example you can take a look at the [`sample configuration file`](conf.sh)

### Breaking change in V 1.2
applies to those that have copied the default config prior to 1.2, or have implemented this themselves.

printing the shorturl in `video_info_text` previously was done like this

`printf "%-${url_len}.${url_len}s\t" "$shorturl"`

this has been deprecated, instead use this line

`printf "%s" "$shorturl"`

---

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
	
+ ### Fzf Shortcuts

    These shortcuts will currently only work in fzf

    + `alt-l`: print the selected urls
    + `alt-t`: print the selected video(s)' title
    + `alt-o`: open the selected video(s) in a browser
    + `alt-v`: watch the selected video(s)
    + `alt-d`: download the selected video(s)
    + `alt-m`: listen to the audio of the selected video(s)
    + `alt-s`: search again
    + `alt-enter`: detach video player

    These shortcuts can all be changed in `~/.config/ytfzf/conf.sh` (see the [config](conf.sh) file and go to the `MISC` section for more)

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

	Player can be changed in the [`conf.sh`](conf.sh) by changing
	```sh
	video_player="devour mpv"
	video_player_format="devour mpv --ytdl-format="
	audio_player="devour mpv --no-video"
	```
	Or via environmental variables as follows
	```sh
	# example: using devour
	FZF_PLAYER="devour mpv"
	YTFZF_PLAYER_FORMAT="devour mpv --ytdl-format="
	YTFZF_AUDIO_PLAYER="devour mpv --no-video"
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
