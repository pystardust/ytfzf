# This is a sample config file, refer to ytfzf(5) for more information


#Variables {{{
video_pref="248+bestaudio/best"
yt_thumbnail_quality=maxres
sub_link_count=1
#}}}

#Functions {{{
external_menu () {
    rofi -dmenu -width 1500 -p "$1"
}
#}}}
