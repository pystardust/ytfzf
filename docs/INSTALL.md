# Installation

## Dependencies

_Fzf is optional, you can use an external menu (like dmenu) with the `-D` option (no thumbnail support)._

* [`mpv`](https://github.com/mpv-player/mpv)
* [`yt-dlp`](https://github.com/yt-dlp/yt-dlpl)
* [`jq`](https://github.com/stedolan/jq) - _to parse json_
* [`fzf`](https://github.com/junegunn/fzf) (Optional if using: `dmenu, rofi`) - _for menu_
* [`notify-send`](https://gitlab.gnome.org/GNOME/libnotify) (Optional) - _for desktop notifications_
* [GNU `shuf`](https://www.gnu.org/software/coreutils/manual/html_node/shuf-invocation.html) or [ISC `shuf`](https://github.com/ibara/shuf) (Optional) - _for selecting random videos_
* [`ueberzug`](https://github.com/seebye/ueberzug) (Optional) - _for thumbnails_
* other thumbnail options
    * [`chafa`](https://github.com/hpjansson/chafa)
    * [`catimg`](https://github.com/posva/catimg)
    * [`jp2a`](https://github.com/cslarsen/jp2a)
> be sure to export `YTFZF_THUMB_DISP_METHOD` in your shell rc or `thumb_disp_method` in the [config](conf.sh) when not using ueberzug

> Thumbnails only work with `fzf` as of now.

+ #### Arch based

	  sudo pacman -S jq mpv yt-dlp fzf

	> For thumbnails

	  sudo pacman -S ueberzug

+ #### Other Distros

	  Dependencies: jq mpv fzf [yt-dlp]("https://github.com/yt-dlp-yt-dlp")

	> For thumbnails

	  pip install ueberzug


## Installation-Options


1. #### Installation by direct download

	```sh
	curl -sL "https://raw.githubusercontent.com/pystardust/ytfzf/master/ytfzf" | sudo tee /usr/local/bin/ytfzf >/dev/null && sudo chmod 755 /usr/local/bin/ytfzf
	```

2. #### Arch users can install ytfzf from the [AUR](https://aur.archlinux.org/packages/ytfzf/)

	```
	yay -S ytfzf
	```
	
	Or alternatively from [@JojiiOfficials](https://github.com/JojiiOfficial) [pacman repository](https://repo.jojii.de)

3. #### FreeBSD users can install ytfzf as a binary package with [pkg(8)](https://www.freshports.org/multimedia/ytfzf/)

	```
	pkg install ytfzf
	```

	Or alternatively, build the port from source

	```
	make -C /usr/ports/multimedia/ytfzf install
	```

4. #### Gentoo users can install ytfzf from the [nitratesky](https://github.com/VTimofeenko/nitratesky) overlay

	```
	eselect repository enable nitratesky
	emerge -a1 net-misc/ytfzf
	```

5. #### Debian and Ubuntu LTS can get it from [MPR](https://mpr.hunterwittenborn.com/)
	
	```
	git clone https://mpr.hunterwittenborn.com/ytfzf.git
	makedeb -i
	```

6. #### Fedora users can install ytfzf from [COPR](https://copr.fedorainfracloud.org/coprs/bhoman/ytfzf/) with mpv from [RPM Fusion](https://rpmfusion.org/Configuration)

	```
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
	sudo dnf copr enable bhoman/ytfzf
	sudo dnf install ytfzf
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

