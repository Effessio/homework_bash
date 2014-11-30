ps aux| egrep "^\w* * [0-9]{4} " | grep gnome | sort -r -n -k2
ps aux| egrep "^\w* * [0-9]{4} " | grep '127\.0\.0\.1' | sort -r -n -k2