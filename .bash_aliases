alias ll='ls -lav'

alias findlarge='find . -type f -size +5M -exec ls -hlog {} \; | sed -r -e "s/^(\S+\s+)(\S+\s+)(\S+\s+)(\S+\s+)(\S+\s+)(\S+\s+)/\3/g" | sort -hr'

alias xdebug_remote='ssh -R 9000:localhost:9000'

alias gpush-all='for remote in $(git remote); do git push $remote; done'

