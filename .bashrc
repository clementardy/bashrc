
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return


# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoredups # ignore duplicate lines
export HISTCONTROL=ignoreboth # ignore duplicates and commands starting with a space

# append to the history file, don't overwrite it
shopt -s nocaseglob # Case-insensitive globbing (used in pathname expansion)
bind 'set completion-ignore-case on' # Case-insensitive tab completion
bind 'set show-all-if-ambiguous on' # List all completions on double tab
bind 'TAB:menu-complete' # Cycle through completions
CD() { builtin cd "${@,,}"; } # Go to a directory, case-insensitive

# check the window size after each command and, if necessary,
shopt -s checkwinsize

alias rm='rm -i' 	# confirm before removing a file
alias cp='cp -i'	# confirm before overwriting a file
alias mv='mv -i'	# confirm before moving a file
#
# Default to human readable figures
alias df='df -h' 							# human-readable sizes
alias du='du -h' 							# human-readable sizes
#
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #


# some shortcut for different directory and explorer open
alias explorer='explorer.exe $(cygpath -w .)'



# Change directory aliases
alias home='cd ~' 
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias bd='cd "$OLDPWD"' 

alias f="find . | grep "

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# PS1
export PS1="\[\e[1;32m\][\A] \[\e[0;36m\]\u \[\e[0;35m\]\w \[\e[0m\]\n$ "

# shortcut to edit bashrc
alias bashrc='less $(cygpath -w ~/.bashrc)'
alias h='history | grep'
alias p='ps aux |'

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

path() {
    echo "Liste des chemins dans \$PATH :"
    echo $PATH | tr ':' '\n'
}

# Searches for text in all files in the current folder
ftext ()
{
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

## Create and go to the directory
mkdirg ()
{
	mkdir -p $1
	cd $1
}
