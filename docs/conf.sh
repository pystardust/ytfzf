# This is a sample config file, refer to ytfzf(5) for more information

# In the previous version of ytfzf this file had all the examples, with all defaults set,
# this has been changed because it made it impossible for us to change default values that were broken or causing bugs,
# as everyone used the default configuration file.
# we are now going to only have this sample config file, and the ytfzf(5) manual, which has explanation of every variable and function that can be set.

#a sample config below:

#Variables {{{
#ytdl_pref="248+bestaudio/best"
##scrape 1 video link per channel instead of the default 2
#sub_link_count=1
#show_thumbnails=1
##}}}
#
##Functions {{{
#external_menu () {
#    #use rofi instead of dmenu
#    rofi -dmenu -width 1500 -p "$1"
#}

#use vlc instead of mpv
#video_player () {
#    #check if detach is enabled
#    case "$is_detach" in
      #	#disabled
      #	0) vlc "$@" ;;
      #	#enabled
      #	1) setsid -f vlc "$@" > /dev/null 2>&1 ;;
  #    esac
#}

#on_opt_parse_c () {
#    arg="$1"
#    case "$arg" in
#	#when scraping subscriptions enable -l
#	#-cSI or -cS
#	SI|S) is_loop=1 ;;
#    esac
#}
#}}}
