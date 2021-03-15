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

## Table of Contents

- [`Dependencies`](docs/INSTALL.md)
- [`Installation`](docs/INSTALL.md)
- [`Usage Instruction`](docs/USAGE.md)
- [`Subscriptions`](#docs/USAGE.md/#Subscriptions)
- [`Examples`](#Exambles)
- [`Todo`](#Todo)
- [`Bugs`](#Bugs)

## Features
- Subscriptions
- Thumbnails
- History
- Download
- Format selection
- Queue multiple videos

## Update Log

* We have now added Subscriptions which allows you to search between videos of subscribed channels easily
* Now ytfzf can queue videos using fzf multiselect option. Press tab to select a video. All the videos will be lined up in mpv. Use `>` and `<` to traverse them.
* Make continuous queries with `-s`
* You can preview video thumbnails now! Using Ueberzug. Inspired by [`fontpreview-ueberzug`](https://github.com/OliverLew/fontpreview-ueberzug).
* Stdin can be taken by using `ytfzf -`, for both fzf and external menu.
* Added MacOS support


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

## Todo 📝

* [ ] Playlists
* [ ] More sites
* [x] Subscriptions
* [x] Thumbnails

## Bugs ❌

* _dwm with swallow patch: Images don't render when looped (ie, option -l)_
- _If thubnails are not working `.Xautority` might be causing it. Try deleting `.Xauthority` and relogging._
