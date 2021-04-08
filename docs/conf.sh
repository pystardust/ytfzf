#This is the default config file
#this file is read when it is placed in ~/.config/ytfzf

#keep in mind that this is a .sh file, and can be used as such

#this config file can be completely empty and ytfzf will still work (as these are the default settings),
    #so feel free to get rid of anything you don't want in here

###################
#  ENV VARIABLES  #
###################

#each variable below can be set here, or using export
#when setting them through export, use the variable in parentheses instead
#variables set through export will override the ones set here

#enable/disable history (enabled by default)
#history is stored in $history_file ($YTFZF_CACHE/ytfzf_hst by default, change $history_file to change this)
#(YTFZF_HIST)
enable_hist=1

#enable/disable looping (disabled by default)
#when enabled, after a video ends it will bring up the results menu again
#(YTFZF_LOOP)
enable_loop=0

#the directory to store cache
#history, thumbnails, and the currently playing video will be stored here
#(YTFZF_CACHE)
cache_dir="$HOME/.cache/ytfzf"

#enable/disable writting the selected menu option to a file
#this file is $YTFZF_CACHE/ytfzf_cur by default, can be changed by changing $current_file
#(YTFZF_CUR)
enable_cur=1

#enable(1)/disable(0) notification when play video
#the notification is send via send-notify
#(YTFZF_NOTI)
enable_noti=0

#the format of the video (1080p, 720p, etc)
#uses the youtube-dl preference system
#must be a number eg: 22 is 720p
#setting this to bestaudio is equivelent to -m
#(YTFZF_PREF)
video_pref=""

#when -D is given it will use this external menu instead of fzf
#(YTFZF_EXTMENU)
external_menu="dmenu -i -l 30 -p Search:"

#the amount of characters that can fit on a line in the external menu
#tweek this for better formatting if the external menu looks weird
#(YTFZF_EXTMENU_LEN)
external_menu_len=220

#the player to use for playing the video, must be able to stream from youtube-dl
#vlc also works
#(YTFZF_PLAYER)
video_player="mpv"

#the player to use when choosing a video format with $YTFZF_PREF or -m
#(YTFZF_PLAYER_FORMAT)
video_player_format="mpv --ytdl-format="

#enable/disable ytfzf's use of your $FZF_DEFAULT_OPTS
#depending on your fzf settings, this could mess up the formatting of the menu
#(YTFZF_ENABLE_FZF_DEFAULT_OPTS)
enable_fzf_default_opts=0

###################
#  OPT VARIABLES  #
###################

#any variables here can be set with options when running the command
#see ytfzf --help for more info

#enable/disable using $external_menu
#same as -D
is_ext_menu=0

#enable/disable viewing of thumbnails (currently only works when using the X display manager)
#same as -t
show_thumbnails=0

#enable/disable selecting the first result automatically
#same as -a
auto_select=0

#enable/disable selecting all results
#same as -A
select_all=0

#enable/disable selecting a random result
#same as -r
random_select=0

#the amount of links to select with -a or -r
#same as -n{number}
link_count=1

#enable/disable only showing the selected video's link
#same as -L
show_link_only=0

#enable/disable showing the different video formats
#same as -f
show_format=0

#the side to show thumbnails
#options are "left", "right", "top", "bottom"
#same as --priview-side=
preview_side="left"

#the amount of links to get from each subscription
#same as --subs=
sub_link_count=10

#whether or not to show --------------channel---------------- when viewing subscriptions
#same as --fancy-subs=
fancy_subscriptions_menu=1

#where to source videos from
#options are history, yt_subs, yt_search
#history is the same as -H
#yt_subs is the same as -S
scrape="yt_search"

#the filter id that will be used when searching youtube
#same as --filter-id={filter}
#to get a filter id go to youtube search for something, choose the filter you want,
    #then take the part of the url that says &sp= (excluding the &sp=) and put it here
#this will override any options having to do with the filter unless you explictly use --filter-id

sp=""

#COMMON FILTERS

#the parentheses are options you can pass when running ytfzf

#UPLOAD DATE FILTERS
#last hour: EgIIAQ (--last-hour)
#today: EgQIAhAB (--today)
#this week: EgQIAxAB (--this-week)
#this month: EgQIBBAB (--this-month)
#this year: EgQIBRAB (--this-year)

#DURATION FILTERS
#short: EgQQARgB
#long: EgQQARgC

#FEATURE FILTERS
#live: EgQQAUAB
#4k: EgQQAXAB
#subtitles/cc: EgQQASgB

#SORT BY FILTERS
#upload date: CAISAhAB (--upload-date)
#view count: CAMSAhAB (--view-count)
#rating: CAESAhAB (--rating)

#to combine any of these filters it would be best to go to youtube,
    #filter how you want, then copy the &sp= part of the url

####################
#       MISC       #
####################

#useragent when using curl on youtube
useragent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36"

#the file for storing watch history
history_file="$cache_dir/ytfzf_hst"

#the file for writing the menu option that was chosen
current_file="$cache_dir/ytfzf_cur"

#the folder where thumbnails are cached
thumb_dir="$cache_dir/thumb"

#available default colors (note: they are be bolded):
    #c_red
    #c_green
    #c_yellow
    #c_blue
    #c_magenta
    #c_cyan
    #c_reset (sets it back to terminal defaults)

#when using the menu, use the text printed in this function to display all the info, $shorturl must be present in order to work
#available variables
    #title
    #title_len, the available tty columns for $title
    #channel
    #channel_len, the available tty columns for $channel
    #duration
    #dur_len, the available tty columns for $duration
    #views
    #view_len, the available tty columns for $views
    #date (video upload date)
    #date_len, the vailable tty columns for $date
    #shorturl (the video ID)
video_info_text() {
	printf "%-${title_len}.${title_len}s\t" "$title"
	printf "%-${channel_len}.${channel_len}s\t" "$channel"
	printf "%-${dur_len}.${dur_len}s\t" "$duration"
	printf "%-${view_len}.${view_len}s\t" "$views"
	printf "%-${date_len}.${date_len}s\t" "$date"
	printf "%-${url_len}.${url_len}s\t" "$shorturl"
	printf "\n"
}


#when displaying thumbnails, use the text printed in this function to show the title, views, etc..
#available variables
    #title
    #channel
    #duration
    #views
    #date (video upload date)
    #shorturl (the video ID)
#how this works:
    #anything printed will stay on the screen in the fzf preview menu
thumbnail_video_info_text () {
         printf "\n${c_cyan}%s" "$title"
         printf "\n${c_blue}Channel      ${c_green}%s" "$channel"
         printf "\n${c_blue}Duration     ${c_yellow}%s" "$duration"
         printf "\n${c_blue}Views        ${c_magenta}%s" "$views"
         printf "\n${c_blue}Date         ${c_cyan}%s" "$date"
}

#when displaying a result that is a channel it will use this function
#available variables
    #title, the name of the channel
    #title_len, the available tty columns for $title

    #the variables below are for spacing each | so it lines up with the rest of the results
    #using $channel, $duration, etc... will not do anything in this function
    #channel_len, the available tty columns for $channel
    #dur_len, the available tty columns for $duration
    #view_len, the available tty columns for $views
    #date_len, the vailable tty columns for $date
channel_info_text () {
    printf "%-${title_len}.${title_len}s\t" "[Channel] $title"
    printf "%-${channel_len}.${channel_len}s\t" "|"
    printf "%-${dur_len}.${dur_len}s\t" "|"
    printf "%-${view_len}.${view_len}s\t" "|"
    printf "%-${date_len}.${date_len}s\t" "|"
    printf "%s" "$shorturl"
    printf "\n"
}
