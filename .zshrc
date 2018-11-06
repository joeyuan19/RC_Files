# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kolo"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx python macports pip node vitrualenv svn npm django emoji-clock help itunes)

export PATH=/Users/joe_yuan/anaconda3/bin:/usr/local/lib/python2.7/site-packages:/usr/local/bin:/usr/X11/bin:/Users/joe_yuan/bin:/usr/local/mysql/bin:/Users/joe_yuan/mongodb/bin:/sbin:/usr/local/Cellar:/usr/local/bin:/usr/local/sbin:/bin:/Users/joe_yuan/.rvm/binlocal/bin:/usr/bin:/usr/local/lib:/usr/sbin

DYLD_LIBRARY_PATH='/usr/local/mysql/lib'
export DYLD_LIBRARY_PATH

export PYTHONPATH='/Users/joe_yuan/pip_install'

export BROWSER="firefox"
export LANG="en_US.utf8"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#{{{ ZSH Modules

autoload -U compinit promptinit zcalc zsh-mime-setup
compinit
promptinit
zsh-mime-setup

#}}}

setopt COMPLETE_IN_WORD
setopt AUTO_LIST
setopt COMPLETE_ALIASES
setopt ALWAYS_TO_END
setopt AUTO_PARAM_SLASH 
setopt NO_SHARE_HISTORY


# eliminate need to type 'cd' before changing directories
setopt AUTO_CD

# spell check
#setopt CORRECT

# 10 second wait before deleting mass amounts of data
setopt RM_STAR_WAIT

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias rm='rm -ir'
alias mv='mv -i'
alias cp='cp -ir'
alias -g mkdir='mkdir -pv'
alias -g opena='open -a'
alias ot='open -a TextEdit'
alias ls='ls -ap'
alias lr='ls -R'
alias chrome='open -a Google\ Chrome'
alias firefox='open -a FireFox'
alias safari='open -a Safari'
alias opera='open -a Opera'
alias sudoku='open -a Sudoku'
alias py='python3.6'
alias py3='python3.6'
alias py2='python2.7'
alias itunes='opena iTunes'
#alias jupyter3.6='/Library/Frameworks/Python.framework/Versions/3.6/bin/jupyter'

export EDITOR="vim"

# makes a nice prompt with time, name, machine
PS1='[%T]:%c$ '

# cpu usage for long processes
REPORTTIME=10


# open to this file
function settings() {
	vi ~/.zshrc;
}

# open Quotations Page
function Quotation() {
	open -a TextEdit ~/Desktop2/Notes/Quotation.rtf;	
}

# FOLDER SHORTCUTS
function APIS() {
    echo "Changing to API directory...";
    cd ~/Desktop2/APIS;
}
function PROJECTS() {
    echo "Changing to PROJECT directory...";
    cd ~/Desktop2/Projects;
}
function LAB() {
    echo "Changing to LAB directory...";
    cd ~/Desktop2/ShabaniLab;
}
function COURSES() {
    echo "Changing to COURSES directory...";
    cd ~/Desktop2/School/NYU/Courses;
}
function cleanup() {
    echo "Are you sure? [y/n]"
    read -rs -k 1 ans
    if ["${ans}"=="y"]; then
        rm .**.un~
    fi
}


# PROJECT SHORTCUTS
function peer_view() {
	echo "Changing directory to project folder...";
	cd ~/Desktop2/Projects/PeerView;
	echo "Directoy entered.";
	echo "Sourcing to project environment...";
	source PeerViewEnv/bin/activate;
	echo "Project environment entered.";
	cd PeerView;
	echo "Pulling from git...";
	git pull;
	echo "Pulled from git";
	echo "Installing/Updating dependancies...";
	./install_dep.sh;
	echo "Dependancies installed/updated.";
	cd PeerView;
}


# resource the .zshrc
function resource() {
	echo 'Setting new configurations...';
	source ~/.zshrc;
}

# source to python2 settings
function resource-py2() {
	echo 'Switiching to py2';
        alias py='Python2.7'
        alias pip='pip2.7'
        PS1='[%T](py2):%c$ '
}

function add_git_ignore() {
    cp ~/.gitignore_master .gitignore
}

# perform git add, commit, push all in one!
function git-add_commit_push() {
	if [ "${1}" ]; then
		git add .;
		git commit -m "$@";
		git push;
	else
		echo "No commit message supplied. Usage: git-add_commit_push <message>";
	fi
}
function git-include-removals_acp() {
	if [ "${1}" ]; then
		git add --all .;
		git commit -m "$@";
		git push;
	else
		echo "No commit message supplied. Usage: git-add_commit_push <message>";
	fi
}


# draw a fractal!
function fractal() {
   local lines columns colour a b p q i pnew
   ((columns=COLUMNS-1, lines=LINES-1, colour=0))
   for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
       for ((a=-2.0; a<=1; a+=3.0/columns)) do
           for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
               ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
           done
           ((colour=(i/4)%8))
            echo -n "\\e[4${colour}m "
        done
        echo
    done
}

function url-encode() {
    setopt extendedglob;
    echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}";
}

# google the argument
function google() {
    open -a Firefox "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

function google_wrapper() {
    open -a Firefox "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

function music_search()  {
    google_wrapper "intitle:index.of mp3 -html -htm -php -asp -txt -pls -wallywashis -unknownsecret -mp3toss" ${(j: :)@}
}

# set the screen saver as the desktop background
function screen_saver_background() {
    /System/Library/Frameworks/ScreenSaver.framework/Resources/;
    ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background;
}

function matrix_display() {	
    (set -o noglob;while sleep 0.05;do for r in `grep -ao '[[:print:]]' /dev/urandom|head -$((COLUMNS/3))`;do [ $((RANDOM%6)) -le 1 ] && r=\ ;echo -ne "\e[$((RANDOM%7/-6+2));32m $r ";done;echo;done)
}

function webfaction_server_ssh() {
    ssh joeyuan19@web425.webfactional.com;

}

function sdl_compile() {
    g++ ${1} -o $(echo ${1} | sed s/\.cpp/\.o/) -I/usr/local/include -L/usr/local/lib -lSDL2
}


function toggle_hidden_files() {
value=$(defaults read com.apple.finder AppleShowAllFiles);
if [ $value = "TRUE" ]; then
    defaults write com.apple.finder AppleShowAllFiles FALSE;
    echo "Set hidden files to not visible";
else
    defaults write com.apple.finder AppleShowAllFiles TRUE;
    echo "Set hidden files to visible";
fi
echo "Restarting Finder...";
killall Finder;
}

function pdiff() {
    python3.4 ~/.zsh_resources/diff.py ${1} ${2}
}

# Quick fix for LC_ALL
# See: http://stackoverflow.com/questions/36394101/pip-install-locale-error-unsupported-locale-setting

export LC_ALL=C


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
