# This is a sample config file, refer to ytfzf(5) for more information

# In the previous version of ytfzf this file had all the examples, with all defaults set,
# this has been changed because it made it impossible for us to change default values that were broken or causing bugs,
# as everyone used the default configuration file.
# we are now going to only have this sample config file, and the ytfzf(5) manual, which has explanation of every variable and function that can be set.


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
