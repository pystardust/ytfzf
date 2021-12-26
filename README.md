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

---

# Table Of Contents

* [`Dependencies`](#Dependencies)
* [`Install`](#Install)
* [`Features`](#Features)
* [`Examples`](#Examples)
* [`Todo`](#Todo)
* [`Bugs`](#Bugs)

---

# Dependencies

There is only 1 required dependency, however the rest may require some configuration before you can replace them.

## Requried dependencies

* [`jq`](https://github.com/stedolan/jq)

## Recommended dependencies

* [`mpv`](https://github.com/mpv-player/mpv) (the default video and audio player)
* [`fzf`](https://github.com/junegunn/fzf) (the default menu selection screen)

## Optional dependencies

* [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) (for downloading)
* [`dmenu`](https://tools.suckless.org/dmenu/) (only if using the -D option)
* [`ueberzug`](https://github.com/seebye/ueberzug) (if using thumbnails (-t) on x11)
    * [`chafa`](https://github.com/hpjansson/chafa) (if using thumbnails (-t) on wayland, sadly it's not as good as ueberzug)


# Install

1. Install the dependancies listed [above](#Dependencies)
2. Run the following commands
```sh
git clone https://github.com/pystardust/ytfzf
cd ytfzf
sudo make
```

* ytfzf may be in some repositories, such as the AUR, however the above way is the recommended way to install.

# Features

* Subscriptions
* Thumbnails
* Watch history
* Downloading
* Queueing multiple videos

# Examples

> Search with thumbnails

```sh
ytfzf -t <search>
```

> Use `dmenu` as the menu instead of `fzf`

```sh
ytfzf -D <search>
```

> Print the link of the selected video instead of playing it

```sh
ytfzf -L <search>
```

> Search Odysee instead of youtube

```sh
ytfzf -cO <search>
```

# Todo

* [ ] Playlists
* [ ] More sites
* [x] Subscriptions
* [x] Thumbnails

# Bugs

* *dwm with swallow patch: Images don't render with ueberzug when looped (ie, option `-l`)
* *if thumbnails are not working `.Xauthority` might be causing it. Try deleting it and relogging into your computer.
