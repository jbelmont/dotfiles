### Aliases defined
alias ..='cd ../' # go up one directory 
alias ...='cd ../../' # go up two directories
alias ....='cd ../../../' # go up three directories
alias .....='cd ../../../../' # go up four directories
alias ......='cd ../../../../../' # go up five directories
alias ls='ls --color -C'
alias ll='ls -al --color --file-type'
alias cp='cp -i'
alias dirs="dirs -v"
alias processNum="ps -ax | grep"
alias vless='vim -u /usr/local/share/vim/vim73/macros/less.vim'
alias info='info --vi-keys'
alias mv='mv -i'
alias p='pushd'
alias netcat='nc'
alias md5sum='md5'
alias eclimd='/Applications/eclipse/eclimd'
alias ccat="source-highlight --out-format=esc -o STDOUT -i"
alias start_mysql='sudo /usr/local/mysql-5.5.28-osx10.6-x86_64/support-files/mysql.server start'
alias stop_mysql='sudo /usr/local/mysql-5.5.28-osx10.6-x86_64/support-files/mysql.server stop'
alias start_apache='sudo apachectl start'
alias restart_apache='sudo apachectl restart'
alias stop_apache='sudo apachectl stop'
alias my_server="ssh -lroot 216.158.67.244"
alias cheat_sheet="less ~/Linux_Unix_programming/Linux_Cheat_Sheet.sh"
alias eclimd='/Applications/eclipse/eclimd'
alias algorithms='cd /Users/jean-marcelbelmont/JavaSpecialJarFiles/SedgewickAlgorithmsJarContents/algs4_stdlib_jar_Contents'
alias algs4data='cd ~/Algorithms/algs4-data/'
alias proofchecker='java -jar ~/JavaSpecialJarFiles/ProofChecker/ProofChecker.jar'
alias acrobat='open -a /Applications/Adobe\ Acrobat\ X\ Pro/Adobe\ Acrobat\ Pro.app'
alias mathtype='open -a /Applications/MathType\ 6/MathType.app'
alias calculator='open -a /Applications/Calculator.app'
alias dreamweaver='open -a /Applications/Adobe\ Dreamweaver\ CS6/Adobe\ Dreamweaver\ CS6.app'
alias photoshop='open -a /Applications/Adobe\ Photoshop\ CS6/Adobe\ Photoshop\ CS6.app'
alias illustrator='open -a /Applications/Adobe\ Illustrator\ CS6/Adobe\ Illustrator.app'
alias racket='open -a /Applications/Racket\ v5.2.1/DrRacket.app'
alias tiNspire='open -a /Applications/TI-Nspire\ CAS\ Student\ Software.App'
alias indesign='open -a /Applications/Adobe\ InDesign\ CS6/Adobe\ InDesign\ CS6.app'
alias proofgrader='java -jar ~/JavaSpecialJarFiles/ProofChecker/ProofGrader.jar'
alias jflap='java -jar ~/JavaSpecialJarFiles/JFLAP/JFLAP.jar'
alias mars='java -jar /Users/jean-marcelbelmont/JavaSpecialJarFiles/Mars_Spim/Mars_4_2.jar'
alias qtspim='open -a /Applications/QtSpim.app'
alias swipl='/opt/local/bin/swipl'
alias vmware='open -a /Applications/VMware\ Fusion.app'
alias firefox='open -a /Applications/Firefox.app'
alias safari='open -a /Applications/Safari.app'
alias opera='open -a /Applications/Opera.app'
alias chrome='open -a /Applications/Google\ Chrome.app'
alias textmate='open -a /Applications/TextMate.app'
alias bbedit='open -a /Applications/TextBBEditor.app'
alias eclipse='open -a /Applications/Eclipse/Eclipse.app'
alias word='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ Word.app'
alias excel='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ Excel.app'
alias powerpoint='open -a /Applications/Microsoft\ Office\ 2011/Microsoft\ PowerPoint.app'
alias sql='open -a /Applications/SQLDeveloper.app'
alias fsulinux='ssh -l jbelmont fsulinux1.uncfsu.edu'
alias fsu='cd ~/Documents/FSU/Spring2013/'
alias wingware='open -a /Applications/WingIDE.app'
alias pandora='open -a /Applications/Pandora.app'
alias rm='rm -i'
alias h='history | tail'

# function that creates a directory and cd's into that directory
function mkdircd() {
	mkdir -p "$@" && eval cd "\"\$$#\"";
}

# function that rewrites zsh pwd builtin
function pwd() {
	echo -n "===> "
	builtin pwd
}

#Turn on some options.
setopt auto_cd	#Change directory by typing a directory name on its own.
setopt extended_glob	#Turn on the more powerful pattern matching features.
setopt no_prompt_cr # No carriage return at start of prompt
setopt vi # set mode in zsh to vi

# autoload the run-help for zsh builtin commands
unalias run-help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
export HELPDIR=~/zsh_help

# this autoloads zen zsh scripts into zsh 
fpath=(
	$fpath
	/Users/jean-marcelbelmont/.zen/zsh/scripts
	/Users/jean-marcelbelmont/.zen/zsh/zle 
	/usr/local/share/zsh/site-functions
	/usr/local/share/zsh/
	)
autoload -U zen

# Display man pages in color
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;246m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#Load the function-based completion system.
export LS_OPTIONS='--color=yes'
export PAGER='less' 
export LESSOPEN="| /usr/local/bin/source-highlight-esc.sh %s"
export LESS=' -R '
export EDITOR='/usr/local/bin/vim'
export LS_OPTIONS='--color=yes'

# Ensures that $terminfo values are valid and updates editor information when
# the keymap changes.
function zle-keymap-select zle-line-init zle-line-finish {
  # The terminal must be in application mode when ZLE is active for $terminfo
  # values to be valid.
  if (( ${+terminfo[smkx]} )); then
printf '%s' ${terminfo[smkx]}
  fi
if (( ${+terminfo[rmkx]} )); then
printf '%s' ${terminfo[rmkx]}
  fi

zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward

# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# partial zsh tab completion in color
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'

#Set some variables
#Use 1000 history lines internally, save all of them
#to the file ~/.history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt hist_ignore_dups
autoload -U edit-command-line
zle -N edit-command-line
tabs -2

# Load compsys and one of its fancy modules
zmodload zsh/complist
autoload -Uz compinit
compinit
autoload -U colors && colors

# And set some styles...
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' rehash yes
zstyle -e ':completion:*:approximate:*' max-errors \
          'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'


#vim tags
function _get_tags {
  [ -f ./tags ] || return
  local cur
  read -l cur
  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
}
compctl -x 'C[-1,-t]' -K _get_tags -- vim
#end vim tags

#--------------------------------------------------------------------------------------------------------------------
# function issucceed: Sets the "HISTORY_COLOR" based on the success of the previous command
#--------------------------------------------------------------------------------------------------------------------
function issucceed
{
	if [ "$1" -eq 0 ]; then
		HIST_COLOR="$BOLD_RED"
		PREFIX=""
	else
		HIST_COLOR="$BOLD_YELLOW"
		PREFIX="[$BOLD_RED${1}$WHITE]"
	fi
}

autoload -U colors
colors

#------------------------------------------------------------------------------------
# function precmd: Calls the other functions and creates the prompt
#------------------------------------------------------------------------------------
function precmd
{
	issucceed "$?"
	PS1="${PREFIX}[$BOLD_BLUE%n$BLACK@$BOLD_GREEN%m$BLACK]$BOLD_MAUVE%3~ $HIST_COLOR%! $DEFAULT%# "
#	PS1="%{${fg[yellow]}%}zsh-%# %{${fg[default]}%}"

	export PS1
#	print -Pn "\e]2;%m:%~\a"
#	print -Pn "\e]0;%3~\a"
}

preexec()
{
	psvar[1]=${(V)2}
	print -Pn "\e]2;%m: %v\a"
}

# function precmd
# {
#	autoload -U finder_update
#	(finder_update &)
# }

function chpwd
{
#	echo -n "];$PWD:h:h:t/$PWD:h:t/$PWD:t"
	print -Pn "\e]0;%3~\a"
#	echo -n "];$PWD"
}

#--------------------------------------------
# Color constants used in the prompt
#--------------------------------------------
BLACK="%{[0m%}"
BOLD_BLACK="%{[1;30m%}"
RED="%{[0;31m%}"
BOLD_RED="%{[1;31m%}"
GREEN="%{[0;32m%}"
BOLD_GREEN="%{[1;32m%}"
YELLOW="%{[0;33m%}"
BOLD_YELLOW="%{[1;33m%}"
BLUE="%{[0;34m%}"
BOLD_BLUE="%{[1;34m%}"
MAUVE="%{[0;35m%}"
BOLD_MAUVE="%{[1;35m%}"
CYAN="%{[0;36m%}"
BOLD_CYAN="%{[1;36m%}"
WHITE="%{[0;37m%}"
DEFAULT="%{[0;39m%}"

PS1="[$BOLD_BLUE%n$BLACK@$BOLD_GREEN%m$BLACK]$BOLD_MAUVE%3~%!$BLACK%#"
