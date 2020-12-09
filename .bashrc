# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


echo "Main user profile"



#aliases 

########## UNIMPLEMENTED

#alias dis="echo helpsc (short-cuts), prog, home, delete, incla, delclass, classcoding"
#alias dihh="ctrl + shift + n: new term. window, ctrl + shift + w: close term. window, ctrl + shfit + t: new term. tab, ctrl + c: quit/abort, ctrl + z (in vim): exit vim but leave running in backgrond"


########### NAVIGATION ALIASES
#### directory short cuts

today=$(date +%b_%d)
objs="" # Objects included with the project*.cpp file that need to be compiled and linked for the current project
project_number='9'
prev_proj_num='8'
share_path="/mnt/hgfs/VMware_shared"
alias up="cd ..; pls"
alias upup="cd ../..; pls"
alias shared="cd /mnt/hgfs/VMware_shared; pls"
alias checkshare="ls $share_path/*/"
alias incla="cd ~/EE_422C/in_class/$today/; pls" # incla = in class, redirects to in_class directory
alias mkcla="mkdir ~/EE_422C/in_class/$today/;" 
alias prog="cd ~/Programming/; pls"
alias home="cd ~; pls"
alias curr="cd ~/EE_312/current_project; pls"
################ COMMAND ALASES

alias pls="pwd; ls"
alias delete="mv -t ~/recycling/" # reversible command rather than rm
alias bashrc="vim +155 ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias nt="gnome-terminal --maximize" # nt = new terminal, opens maximized terminal
alias ntr="gnome-terminal geometry=101x60+990"
alias nmake="make > /dev/null" # null make, redirect std make output to null
alias yeet="make > /dev/null" # null make, redirect std make output to null
alias MAGA="cd build; make check" # "Make And Generate Answers"
alias cleanse="make clean"
alias anotherone="up; cleanse; yeet; MAGA"
################  TEMPORARY PROJECT ALIASES
#alias compi="rm a.out; g++ Project*.cpp $objs"
#alias run="compi; ./a.out"

###############  SIMPLIFIED COMPILATION AND RUNNIN
alias runa="compile; ./a.out"
alias compile="g++ -std=c++11 -g *.cpp"
alias dela="rm a.out"

alias vall="echo valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all; valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all" 

############################################## OS EE 461S Aliases ########################
alias pintos-ddd="ddd -gdb -debugger pintos-gdb kernel.o"




############################################## UPDATE AND SVN FUNCITONS #########################
#updrc = update (bash)rc
bashrc_date=$(date +%b_%d_%H^%M^%S)
updrc(){
#date +%b_%d_%H^%M^%S
    bashrc_date=$(date +%b_%d_%H^%M^%S)
	if [ -f $share_path/bashrc/bashrc_* ]; then
        echo old exists*******************
        mv $share_path/bashrc/bashrc_* $share_path/bashrc/archive
    fi
    #cp ~/.bashrc $share_path/bashrc/bashrc_$bashrc_date
	ls -lt $share_path/bashrc/

}
#update project (temporary project SVN and share with host
updpr(){
    bashrc_date=$(date +%b_%d_%H^%M^%S)
	cp  ~/EE_312/current_project/Project*.cpp $share_path/current_project/project$project_number^$bashrc_date.cpp
	ls -lt $share_path/current_project/

}
updvim(){
    bashrc_date=$(date +%b_%d_%H^%M^%S)
	cp ~/.vimrc $share_path/vimrc/vimrc_$bashrc_date
	ls -lt $share_path/vimrc/

}


################################################## EE 312 FUNCTIONS #############################

curr_path="~/EE_312/current_project"
class_lang="cpp"
#classcoding creates a directory and c source code for daily coding exercises in EE 312 class. They are located in ~/EE_312/inclass/
classcoding(){
	mkdir ~/EE_312/in_class/$today
	cd  ~/EE_312/in_class/$today
	if [ ! -f ~/EE_312/in_class/$today/in_class_$today.$class_lang ]; then
        cp -u  ~/Programming/start.$class_lang ~/EE_312/in_class/$today/
	    mv ~/EE_312/in_class/$today/start.$class_lang ~/EE_312/in_class/$today/in_class_$today.$class_lang
	fi
    vim in_class_$today.$class_lang
}

coderes(){
    cd ~/EE_312/in_class/$today
    vim in_class_$today.c
}

projsetup(){
    # clear last project
    echo setting up project..
    if [ ! -d ~/EE_312/old_projects/project$prev_proj_num ]; then
        echo making previous project directory...
        mkdir ~/EE_312/old_projects/project$prev_proj_num
    fi
    if [  -d ~/EE_312/current_project/* ]; then
    echo moving old files...
        mv  ~/EE_312/current_project/* ~/EE_312/old_projects/project$prev_proj_num/ 2>/dev/null
    fi
    # import new project from canvas and setup
    if [  -d ~/EE_312/current_project/* ]; then
        echo move failed
    fi
    if [ -f /mnt/hgfs/VMware_shared/canvas/* ]; then
        echo importing project zip...
        import312
    fi
    if [ -f ~/EE_312/imported/* ]; then
        mv ~/EE_312/imported/*.zip ~/EE_312/project_zips/Project$project_number.zip
    fi
    
    cp ~/EE_312/project_zips/Project$project_number.zip ~/EE_312/current_project/
    curr
    echo unzipping project...
    unzip Project$project_number.zip
    cd Project*
    mv ./* ../
    cd ../ 
    rm -r *\ *
    delete *.zip
    echo done
}

#move averything from the shared canvas/ directory to ~/EE_312/imported
import312(){
	mv /mnt/hgfs/VMware_shared/canvas/* ~/EE_312/imported	

}
 
chkimport(){
	ls /mnt/hgfs/VMware_shared/import/
}

importhgfs(){
	mv /mnt/hgfs/VMware_shared/import/* ./
	ls
}	








# Put pintos in PATH
source /home/tompmcr/EE_461S/2_pintos/Pintos_Starter/.PINTOS_PATH
alias pintos-gdb='GDBMACROS=/home/tompmcr/EE_461S/2_pintos/Pintos_Starter/misc/gdb-macros pintos-gdb'

# Put pintos in PATH
source /home/tompmcr/OS_EE_461S/try_again_lab_2/PintosTryAgain/.PINTOS_PATH
alias pintos-gdb='GDBMACROS=/home/tompmcr/OS_EE_461S/try_again_lab_2/PintosTryAgain/misc/gdb-macros pintos-gdb'


if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    fortune | cowsay
fi
