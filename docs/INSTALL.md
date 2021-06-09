# Installation

## Dependencies

_Fzf is optional, you can use an external menu (like dmenu) with the `-D` option (no thumbnail support)._

* [`mpv`](https://github.com/mpv-player/mpv)
* [`youtube-dl`](https://github.com/ytdl-org/youtube-dl)
* [`jq`](https://github.com/stedolan/jq) - _to parse json_
* [`fzf`](https://github.com/junegunn/fzf) (Optional) - _for menu_
* [`ueberzug`](https://github.com/seebye/ueberzug) (Optional) - _for thumbnails_
* other thumbnail options
    * [`chafa`](https://github.com/hpjansson/chafa)
    * [`catimg`](https://github.com/posva/catimg)
    * [`jp2a`](https://github.com/cslarsen/jp2a)
> be sure to export `YTFZF_THUMB_DISP_METHOD` in your shell rc or `thumb_disp_method` in the [config](conf.sh) when not using ueberzug

> Thumbnails only work with `fzf` as of now.

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


## Installation-Options


1. #### Installation by direct download

	```sh
	curl -sL "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" | sudo tee /usr/bin/ytfzf >/dev/null && sudo chmod 755 /usr/bin/ytfzf
	```

   _MacOS users might need to change their installation path from  `/usr/bin/` to `/usr/local/bin/`_

2. #### Arch users can install ytfzf from the [AUR](https://aur.archlinux.org/packages/ytfzf-git/)

	```
	yay -S ytfzf
	```
	
	Or alternatively from [@JojiiOfficials](https://github.com/JojiiOfficial) [pacman repository](https://repo.jojii.de)

3. #### Gentoo users can install ytfzf from the [nitratesky](https://github.com/VTimofeenko/nitratesky) overlay

	```
	eselect repository enable nitratesky
	emerge -a1 net-misc/ytfzf
	```

### Installation by cloning the repository

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

