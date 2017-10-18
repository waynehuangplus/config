# .bashrc

if [ "x$YROOT_NAME" != "x" ]; then
    PS1="[\u@\h:$YROOT_NAME \w]\\$ "
    complete -cf sudo
else
    #PS1="\[\033[01;37m\][\u@\h \w] \\$ \[\033[00m\]"
    PS1="\[\033[01;37m\]\h [\w] -\u- \[\033[00m\]"
    complete -cf sudo
fi

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi


# Dynamically change screen title by hostname
if [ $TERM = 'screen' ]; then

	if [ `hostname` = 'bottlering.tpcity.corp.yahoo.com' ]; then
		PROMPT_COMMAND='echo -ne "\033kbottlering\033\\"'

	elif  [[ `hostname` =~ .*.(gb|db).hkac.* ]]; then
		SHORT_NAME=`echo $HOSTNAME |awk -F '.' '{print $1 "." $2"@" $4}'`
		PROMPT_COMMAND='echo -ne "\033k$SHORT_NAME\033\\"'

	else
		SHORT_NAME=`echo $HOSTNAME |awk -F '.' '{print $1 "." $2"@" $3}'`
		PROMPT_COMMAND='echo -ne "\033k$SHORT_NAME\033\\"'
	fi
fi

if [ "$TERM_PROGRAM" = 'iTerm.app' ]; then
	alias ls='ls -G' 
fi

# User specific aliases and functions
export EDITOR=vim
export LESS='-R'

#export PAGER=more
export LC_ALL=en_US.UTF-8

# Bash History
## don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
## Make bash append rather than overwrite the history on disk
shopt -s histappend
## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# Bind key
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'
bind '"\x1b\x5b\x41":history-search-backward'
bind '"\x1b\x5b\x42":history-search-forward'


alias h='history 25'
alias j='jobs -l'

# For different environments
if [ `uname` == 'Linux' ]; then
alias ls="ls -AF --color"
elif [ `uname` == 'FreeBSD' ]; then
alias ls="ls -AFG"
fi

alias br='iconv -f big5 -t utf-8//IGNORE'
alias hn='hostname'
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lA'
alias t='telnet'
alias cls='clear'
alias vi='vim'
alias ..='cd ../'
alias ....='cd ../../'
alias df='df -h'
alias y='cd /home/y'
alias his='history'
alias sy='cat /home/y/logs/yapache/hk/access /home/y/logs/yapache/hk/access.[1-255] | readlog -f url |grep "bid_hist$"'
alias cm3_check='sudo /var/cm3/bin/svstat /var/cm3/service/*'
alias cm3_stop='sudo /var/cm3/bin/svc -d /var/cm3/service/cm3_client'
alias cm3_start='sudo /var/cm3/bin/svc -u /var/cm3/service/cm3_client'
alias netstat='sudo netstat -lnpt'
alias status_stop='yinst stop yapache_status'
alias status_start='yinst start yapache_status'
alias yapache_stop='yinst stop yapache'
alias yapache_start='yinst start yapache'
alias yisnt='yinst'
alias gl="git log --graph --decorate --pretty=format:'%C(auto)%h %C(bold black)%an%Creset%C(auto)%d %s' --abbrev-commit --date-order"

#if [ "$OSTYPE" != darwin13 ] ;then
#	alias ssh='yssh'
#	alias scp='yscp'
#fi

#alias rhel_check="yinst ls -config | grep 'requires os'  | awk -F. '{print $1}' | sort -u | awk 'BEGIN {four=0; six=0} /4/ {four++} /6/ {six++} END {if (four>0 && six>0) { print "mixed" } else { if (six>0) { print "six"}; if (four>0) { print "four"}}}'"



#complete -cf sudo
set cdspell
set time='30 "\
Time spent in user mode   (CPU seconds) : %Us\
Time spent in kernel mode (CPU seconds) : %Ss\
Total time                              : %Es\
CPU utilisation (percentage)            : %P\
Times the process was swapped           : %W\
Times of major page faults              : %F\
Times of minor page faults              : %R"'

## SSH Agent
## set environment variables if user's agent already exists
#[ -z "$SSH_AUTH_SOCK" ] && SSH_AUTH_SOCK=$(ls -l /tmp/ssh-*/agent.* 2> /dev/null | grep $(whoami) | awk '{print $9}')
#[ -z "$SSH_AGENT_PID" -a -z `echo $SSH_AUTH_SOCK | cut -d. -f2` ] && SSH_AGENT_PID=$((`echo $SSH_AUTH_SOCK | cut -d. -f2` + 1))
#[ -n "$SSH_AUTH_SOCK" ] && export SSH_AUTH_SOCK
#[ -n "$SSH_AGENT_PID" ] && export SSH_AGENT_PID
#
## start agent if necessary
#if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then  # if no agent & not in ssh
#  eval `ssh-agent -s` > /dev/null
#fi

if [ -z $SSH_AUTH_SOCK ]; then
	export SSH_AUTH_SOCK=/Users/wshuang/.ssh/ssh_auth_sock
fi



# Initialize environment
function s()
{
	if [ -z $1 ]; then
		
		echo "no arguments"
		return 0
	else
		echo "connect to $1 & sync bashrc"
		scp -r ~/.bashrc ~/.bash_profile ~/.vimrc ~/.vim $1:~/
		ssh $1
	fi

}

# Define PATH
export PATH="/usr/kerberos/bin:/home/y/bin64:/home/y/bin:/usr/local/sbin:/sbin:/usr/sbin:/usr/local/bin:/bin:/usr/bin:/home/wshuang/bin:$HOME/gradle-2.3/bin:/home/gs/hbase/current/bin:/usr/local/go/bin:/Users/wshuang/gohome/bin:/usr/local/opt/protobuf@2.5/bin"

# Change ls color
declare -x LS_COLORS="no=00:fi=00:di=00;36:ln=02;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:"

# For Java Env
export M2_HOME=/Users/wshuang/apache-maven-3.3.3
export PATH=$PATH:$M2_HOME/bin

# Go lang
export GOPATH=/Users/wshuang/gohome

if  [[ `hostname` =~ .*.ygrid.yahoo.com ]]; then
	export JAVA_HOME=/home/gs/java/jdk
else
	export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_51.jdk/Contents/Home
fi
export PYTHONPATH="/home/y/lib64/python2.7/site-packages"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
