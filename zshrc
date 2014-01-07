# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER=`whoami`
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode urltools web-search brew cpanm dircycle fabric osx rsync textmate torrent screen ruby mercurial perl colorize colored-man python \
  history-substring-search compleat copydir git-extras git-hubflow github git-flow git git-hubflow ssh-agent themes osx zsh-syntax-highlighting \
  gitignore git-flow-avh tmux history
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# PATH variables 
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:/usr/local/opt/gnu-tar/libexec/gnubin:\
/Users/jean-marcelbelmont/bin:/usr/local/opt/ruby193/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/share/man:/usr/bin/man:/opt/local/share/man:$MANPATH"

### Aliases defined
alias cp='cp -i'
alias dirs="dirs -v"
alias ls='ls --color=auto'
alias vless='vim -u /usr/local/share/vim/vim74/macros/less.vim'
alias info='info --vi-keys'
alias mv='mv -i'
alias p='pushd'
alias netcat='nc'
alias md5sum='md5'
alias ccat="source-highlight --out-format=esc -o STDOUT -i"
alias cheat_sheet="less ~/Linux_Unix_programming/Linux_Cheat_Sheet.sh"
alias algorithms='cd ~/JavaSpecialJarFiles/SedgewickAlgorithmsJarContents/algs4_stdlib_jar_Contents'
alias algs4data='cd ~/Algorithms/algs4-data/'
alias proofchecker='java -jar ~/JavaSpecialJarFiles/ProofChecker/ProofChecker.jar'
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
alias mars='java -jar ~/JavaSpecialJarFiles/Mars_Spim/Mars_4_2.jar'
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
alias fsu='cd ~/Documents/FSU/Fall_2013/'
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
	echo -n "==> "
	builtin pwd
}

function processNum() {
  ps -ax | grep
}

function hostigation_server() {
  ssh root@69.85.84.104
}

# source tmuxinator in zsh
source ~/.tmuxinator/tmuxinator.zsh

# Turn on some options.
setopt extended_glob	# Turn on the more powerful pattern matching features.
setopt no_prompt_cr # No carriage return at start of prompt
setopt vi # set mode in zsh to vi
setopt no_hist_verify # stops zsh from expanding !! notation when you hit enter
setopt hist_ignore_dups # ignore history duplicate
setopt hist_allow_clobber # allow history to be clobbered
setopt inc_append_history
setopt share_history

# autoload the run-help for zsh builtin commands
unalias run-help
autoload run-help
export HELPDIR="/usr/local/share/zsh/helpfiles"

# set grep options for color output
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;35;40'

#Load the function-based completion system.
export PAGER='less' 
export LESSOPEN="| /usr/local/bin/source-highlight-esc.sh %s"
export LESS=' -R '
export EDITOR='/usr/local/bin/vim'
export LS_OPTIONS='--color=auto'
eval `dircolors ~/.dir_colors`

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd '?' history-incremental-search-backward

#Use 1000 history lines internally, save all of them
#to the file ~/.history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
autoload -U edit-command-line
zle -N edit-command-line
tabs -2

# Load compsys and one of its fancy modules
zmodload zsh/complist
autoload -Uz compinit
compinit
autoload -U colors && colors
zmodload -i zsh/mathfunc
zmodload -i zsh/pcre
zmodload -i zsh/regex
zmodload -i zsh/zutil
zmodload -i zsh/complete
zmodload -i zsh/stat
zmodload -i zsh/zftp
zmodload -i zsh/zselect

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
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'

#vim tags
function _get_tags {
  [ -f ./tags ] || return
  local cur
  read -l cur
  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
}
compctl -x 'C[-1,-t]' -K _get_tags -- vim
#end vim tags
