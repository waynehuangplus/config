# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/apache-maven-3.5.3/bin:/usr/local/opt/protobuf@2.5/bin:$PATH

# Java settings
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home/
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home/

# Spark Home
export SPARK_HOME=/Users/wshuang/ayla/spark

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  docker
  encode64
  httpie
  jsontools
  mvn
  perms
  pip
  pep8
  tmux
  urltools
)

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ZShell autojump
  [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Command aliases
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

# Bind key
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# ssh
s() {
        if [ -z $1 ]; then

                echo "no arguments"
                return 0
        else
                echo "connect to $1 & sync bashrc"

                scp ~/.bashrc $1:/tmp/.bashrc_wayne
                #ssh -t $1 "bash --rcfile /tmp/.bashrc_wayne; rm /tmp/.bashrc_wayne"
                ssh -t $1 "bash --rcfile /tmp/.bashrc_wayne"
        fi

}

git-stats() {
	author=${1-`git config --get user.name`}

	echo "Commit stats for \033[1;37m$author\033[0m:"
	git log --shortstat --author $author -i 2> /dev/null \
		| grep -E 'files? changed' \
		| awk 'BEGIN{commits=0;inserted=0;deleted=0} \
			{commits+=1; if($5!~"^insertion") { deleted+=$4 } \
			else { inserted+=$4; deleted+=$6 } } END \
			{print "\033[1;34m↑↑\033[1;37m", commits \
			"\n\033[1;32m++\033[1;37m", inserted, \
			"\n\033[1;31m--\033[1;37m", deleted, "\033[0m"}'
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/wshuang/.sdkman"
[[ -s "/Users/wshuang/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/wshuang/.sdkman/bin/sdkman-init.sh"
