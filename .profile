SYSID=`hostname`
SHORTSYS=${SYSID%%.*}

SFTWR=/Users/sburrows/Software

export JBOSS_HOME=/Applications/EnterprisePlatform-4.3.0.GA_CP03/jboss-as

export PATH=~/bin:$SFTWR/maven/2.1.0/bin:/opt/subversion/bin:/usr/local/bin:/usr/local/ssl/bin:/Developer/usr/bin:/Developer/usr/sbin:$PATH:~/Software/android-sdk-mac_86/tools:~/Software/android-sdk-mac_86/platform-tools:/usr/local/rvm/bin

export MAVEN_OPTS=-Xmx1024m

alias ll='ls -al'
alias vset='vi ~/.m2/settings.xml'

# GIT
alias gls='git log --color --pretty=format:"%H  %an  %ad  %s"'

GOYELL="\033[33;1m"
UNYELL="\033[37;0m"

export PS1="${GOYELL}${USER}:${UNYELL} "

export CLICOLOR=true
export LSCOLORS=gxfxcxdxbxegedbabagdge

shopt -s cdable_vars

apps=/Applications

repo=~/.m2/repository

######################################################################
#Start of section defining some neat things that are only used
#inside xterms.  Displays current directory, host, and user-id in title
#bar by overriding cd.  Also, change icon name.
######################################################################
 
if [ $TERM = xterm -o $TERM = xterm-color -o $TERM = aixterm -o $TERM = dtterm -o $TERM = ansi ] ; then
 
#show args in title bar
function show_in_title
{
#-e means looks for octal stuff (like \033), -n means no newline.
   if [ $SHELL != '/bin/ksh' ]; then
# The dollar signs before the quoted strings was added for bash conformance
     echo -n -e $'\033]2;'$*$'\07'
   else
     print -n -e '\033]2;'$*'\07'
   fi
}
 
#show "myname @ system -- directory" in title bar
function shdr
{
        #eliminate /tmp_mnt from path
        d=${PWD#/tmp_mnt}      # a faster way using builtins
        show_in_title "$USER @ $SHORTSYS - $d"
}
 
alias cd=_cd
function _cd
{
    if [ -z $* ]; then
      'cd'
    else 
      'cd' "$*"
    fi
    shdr
}

#change title bar to reflect new host
alias rlogin=_rlogin
function _rlogin
{
  show_in_title rlogin $*
  \rlogin $*
  newhost
}

#change title bar to reflect new identity
alias su=_su
function _su
{
        #check for the '-' in an su (making the 2nd argument the new identity.
        if [ "$1"x = "-"x ]; then
                tu=$2
        else
                tu=$1
        fi
 
        #check for su'ing to root.
        if  [ "$tu"x = "x" ]; then
                u=root
        else
                u=$tu
        fi
 
        show_in_title "$u @ $SHORTSYS -- ???"
        \su $*
        newhost
}

#Show stuff in title bar and host info in icon
function newhost
{
         shdr
         seticonlabel "$SHORTSYS"
}

#set the icon to be $*
function seticonlabel
{
   if [ $SHELL != '/bin/ksh' ]; then
# The dollar signs before the quoted strings was added for bash conformance
     echo -n $'\033]1;'$*$'\07'
   else
     print -n '\033]1;'$*'\07'
   fi
 
}

#function to list directories only
function dir
{
	ls -AlL $* | grep '^d'
}

#function to keep track of shell levels
function shell_level
{
   if [ $SHELLEVEL = "" ]; then
     export SHELLEVEL=1
   else
     export SHELLEVEL="`$SHELLEVEL + 1`"
   fi
}

#shell_level
newhost

fi

######################################################################
#End of Xterm specific section.
######################################################################

function parse_git_branch {

  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
state="${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
remote="${YELLOW}↑"
    else
remote="${YELLOW}↓"
    fi
fi
if [[ ${git_status} =~ ${diverge_pattern} ]]; then
remote="${YELLOW}↕"
  fi
if [[ ${git_status} =~ ${branch_pattern} ]]; then
branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}


