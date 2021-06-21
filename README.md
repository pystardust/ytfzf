<p align="center">
    <a> <img src=.assets/logo.png></a>
    <br />
    <br />
	<a href="https://github.com/pystardust/ytfzf/stargazers"><img src="https://img.shields.io/github/stars/pystardust/ytfzf?color=orange&logo=github&style=flat-square"></a>
	<a href="https://github.com/pystardust/ytfzf/graphs/contributors"><img src="https://img.shields.io/github/contributors/pystardust/ytfzf?style=flat-square"></a>
	<a href="https://github.com/pystardust/ytfzf/releases/tag/v1.1.1"><img src="https://img.shields.io/github/v/tag/pystardust/ytfzf?style=flat-square"> </a>
	<a href="https://github.com/pystardust/ytfzf/commits/master"><img src="https://img.shields.io/github/commit-activity/m/pystardust/ytfzf?color=green&style=flat-square"></a>
	<a href="https://discord.gg/kupWznHjRJ"><img src="https://img.shields.io/discord/815609275644117022?color=yellow&logo=discord&style=flat-square" alt="Discord"></a>
    <br />
    <br />
    <i>A POSIX script that helps you find Youtube videos (without API) and opens/downloads them using mpv/youtube-dl</i>
	<hr>
</p>

<h1 align="center">
	This is a little showcase
</h1>
<p align="center">
<img src=.assets/ytfzf.gif width="100%">
</p>

## Fast installation

_This one-line installation does not support every OS, detail information for different OS can be found in the [here](docs/INSTALL.md)_

```sh
curl -sL "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" | sudo tee /usr/bin/ytfzf >/dev/null && sudo chmod 755 /usr/bin/ytfzf
```
<sup>*requires cURL</sup>

## Table of Contents

- [`Dependencies`](docs/INSTALL.md/#Dependencies)
- [`Installation`](docs/INSTALL.md/#Installation-Options)
- [`Usage Instruction`](docs/USAGE.md/#Usage-Instructions)
- [`Configurations`](docs/USAGE.md/#Configurations)
- [`Subscriptions`](docs/USAGE.md/#Subscriptions)
- [`Update Log`](https://github.com/pystardust/ytfzf/releases)
- [`Examples`](#Examples)
- [`Todo`](#Todo)
- [`Bugs`](#Bugs)

## Features
- Subscriptions
- Thumbnails
- History
- Download
- Format selection
- Queue multiple videos

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

## Todo

* [ ] Playlists
* [ ] More sites
* [x] Subscriptions
* [x] Thumbnails

## Bugs

* _dwm with swallow patch: Images don't render when looped (ie, option -l)_
- _If thumbnails are not working `.Xauthority` might be causing it. Try deleting `.Xauthority` and relogging._
