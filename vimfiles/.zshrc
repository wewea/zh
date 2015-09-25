# Path to your oh-my-zsh installation.
export ZSH=/home/zhlin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"
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
# ENABLE_CORRECTION="true"

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
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/zhlin/algs4/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi='vim'
alias app='sudo apt-get'
alias jac='javac-algs4'
alias jaa='java-algs4'
alias opendir='nautilus'
alias rzsh='source ~/.zshrc'

############################################
#				self-config				   #
############################################

# entry for visual-studio-code 
function __code() {
	if [ "$@x" != 'x' ]; then
		(~/tools/web/visual-studio-code/Code "$@" &) &> /dev/null
	else
		(~/tools/web/visual-studio-code/Code &) &> /dev/null
	fi
}

alias code="__code"

# set dir_colors
eval `dircolors ~/dircolors-solarized/dircolors.ansi-light
`

# set TERM
if [[ $TERM == xterm ]]; then
 	TERM=xterm-256color
fi

# set for rvm plugins
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# reload theme
function __reload_theme {
	if [[ "$1" =~ [0-9a-z]+ ]]; then
		echo "change theme to $1"
		ZSH_THEME="$1"
	else
		ZSH_THEME="random"	
	fi
	source $ZSH/oh-my-zsh.sh
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

}

alias rt='__reload_theme'

# output theme name
function __out_put_theme_name {
	if [ "$ZSH_THEME" = "random" ];then
		echo "current theme is ${RANDOM_THEME##*/}"
	else
		echo "current theme is $ZSH_THEME"
	fi
}

alias zsh-theme='__out_put_theme_name'


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source $HOME/.nvm/nvm.sh # Add NVM 

# for nvm bash_completion
[[ -r "NVM_DIR"/bash_completion ]] && . $NVM_DIR/bash_completion


# mkdir & cd dir
function mkdir_and_chdir {
	if [ -n "$1" ]; then
		mkdir $1 && cd $1 
	else
		echo "invalid dir name!"
	fi
}

alias mc='mkdir_and_chdir'
