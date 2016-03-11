# rcfiles
A small collection of my personal configuration files.

## Including
If you want to use one of the configuration files in addition to your own files, you can easily include it. Just add the matching line in your own file:

### .bashrc, .bash_aliases and .vimrc
```bash
source /path/to/another/.bash_aliases
```

### .gitconfig
```gitconfig
[include]
  path = /path/to/another/.gitconfig
```

## Configuration

### .rcsettings.sh
The **.bashrc** includes coloring of the bash prompt. If you want to configure these colors, create a file named **~/.rcsettings.sh** with the following contents:
```bash
COLOR_USER=$TERM_FG_NONE # Color for the user name, defaults to none.
COLOR_HOST=$TERM_FG_NONE # Color for the host name, defaults to none.
COLOR_ROOT=$TERM_FG_RED # Color for the user name if bash is run as root, defaults to red.
```
You can use the colors listed below.

### Colors
The following colors are available for the bash systemwide after including the **.bashrc** from this repository:
```bash
TERM_FG_NONE
TERM_FG_BLACK
TERM_FG_RED
TERM_FG_GREEN
TERM_FG_YELLOW
TERM_FG_BLUE
TERM_FG_PURPLE
TERM_FG_CYAN
TERM_FG_GRAY
```

## Licensing
This repository is published under [The Unlicense](http://unlicense.org/UNLICENSE), so feel free to fork this repository, copy some contents, or basically do whatever you want. 

