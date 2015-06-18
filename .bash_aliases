alias ll='ls -lav'

alias findlarge='find . -type f -size +5M -exec ls -hlog {} \; | awk '\''{print $3, $7}'\'' | sort -hr'
