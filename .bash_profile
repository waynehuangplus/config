# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# SSH Agent
if [ "$HOSTNAME" == "bottlering.tpcity.corp.yahoo.com" ]; then
        SSH_ENV="$HOME/.ssh/environment"

        function start_agent {
             echo "Initialising new SSH agent..."
             /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
             echo succeeded
             chmod 600 "${SSH_ENV}"
             . "${SSH_ENV}" > /dev/null
             /usr/bin/ssh-add;
        }

        # Source SSH settings, if applicable

        if [ -f "${SSH_ENV}" ]; then
             . "${SSH_ENV}" > /dev/null
             #ps ${SSH_AGENT_PID} doesn't work under cywgin
             ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
                 start_agent;
             }
        else
             start_agent;
        fi
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export SVN_SSH=/usr/local/bin/yssh
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export PATH
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export M2_HOME=/Users/wshuang/apache-maven-3.3.3
#export PATH=$PATH:$M2_HOME/bin
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home

if [[ $STY =~ chef ]]; then
	source ~/.rvm/scripts/rvm
	#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH="/usr/local/opt/protobuf@2.5/bin:$PATH"
export PATH="/usr/local/opt/protobuf@2.5/bin:$PATH"
platform=`uname`
if [[ $platform == "Darwin" ]]; then
	export SSH_AUTH_SOCK=$HOME/.yubiagent/sock
fi
