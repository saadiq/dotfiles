
# If running interactively, then:
if [ "$PS1" ]; then

  # Quick way to rebuild the Launch Services database and get rid
  # of duplicates in the Open With submenu.
  alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

  export EDITOR=vi

  # don't put duplicate lines in the history. See bash(1) for more options
  export HISTCONTROL=ignoredups

  # enable color support of ls and also add handy aliases
  alias ls='ls -FG'
  export LSCOLORS=ExGxHxdxCxegedabagacad

  # better safe than sorry
  alias rm='rm -i'
  alias cp='cp -i'
  alias mv='mv -i'
  alias mvitunes='mv *.mp4 ~/Music/iTunes/iTunes\ Music/Automatically\ Add\ to\ iTunes/'

  alias mate='open -a textmate'

  export PATH=~/bin:/usr/local/bin:$PATH

  # set a fancy prompt
  #PS1='\u@\h:\w\$ '
  PS1='\u@\[\e[1;36m\]\h\[\e[0m\]:\w\$ '

  xtitle ()
  {
  echo -ne "\033]0;$*\007"
  }

  # If this is an xterm set the title to user@host:dir
  #case $TERM in
  #xterm*)
	#	#PROMPT_COMMAND='xtitle "${HOSTNAME%%.*}:${PWD/$HOME/~}"'
	#PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
  #    ;;
  #*)
  #    ;;
  #esac

  parse_git_branch() {
    ref=$(git symbolic-ref -q HEAD 2> /dev/null) || return
    printf "${1:-(%s)}" "${ref#refs/heads/}"
  }

  parse_svn_revision() {
    local DIRTY REV=$(svn info 2>/dev/null | grep Revision | sed -e 's/Revision: //')
    [ "$REV" ] || return
    [ "$(svn st)" ] && DIRTY=' *'
    echo "(r$REV$DIRTY)"
  }

  pimp_prompt() {
    local        BLUE="\[\033[0;34m\]"
    local   BLUE_BOLD="\[\033[1;34m\]"
    local         RED="\[\033[0;31m\]"
    local   LIGHT_RED="\[\033[1;31m\]"
    local       GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local       WHITE="\[\033[0;37m\]"
    local  WHITE_BOLD="\[\033[1;37m\]"
    local  LIGHT_GRAY="\[\033[0;37m\]"
    case $TERM in
      xterm*)
      TITLEBAR='\[\033]0;\u@\h:\w\007\]'
      ;;
      *)
      TITLEBAR=""
      ;;
    esac
  #PS1="${TITLEBAR}[$WHITE\u@$BLUE_BOLD\h$WHITE \w$GREEN\$(parse_git_branch)\$(parse_svn_revision) $RED\$(~/.rvm/bin/rvm-prompt v g)$WHITE]\$ "
  #PS1="${TITLEBAR}[$WHITE\u@$BLUE_BOLD\h$WHITE \w$GREEN\$(parse_git_branch)\$(parse_svn_revision)$WHITE]\$ "
  PS1="${TITLEBAR}$WHITE_BOLD\u@$BLUE_BOLD\h$WHITE \w$GREEN\$(parse_git_branch)\$(parse_svn_revision)$WHITE\$ "
  PS2='> '
  PS4='+ '
  }
  #pimp_prompt

  # enable programmable completion features (you don't need to enable
  # this, if it's already enabled in /etc/bash.bashrc).
  #if [ -f /etc/bash_completion ]; then
  #  . /etc/bash_completion
  #fi
fi

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
