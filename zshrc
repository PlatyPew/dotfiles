# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/daryllim/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k configs #######################################
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv os_icon user_joined dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time date_joined battery)

POWERLEVEL9K_VIRTUALENV_FOREGROUND="226"
POWERLEVEL9K_VIRTUALENV_BACKGROUND="26"

POWERLEVEL9K_OS_ICON_FOREGROUND="15"
POWERLEVEL9K_OS_ICON_BACKGROUND="grey"

POWERLEVEL9K_USER_DEFAULT_FOREGROUND="15"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="grey"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="46"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="46"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="11"

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_BACKGROUND="32"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="32"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="32"

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

POWERLEVEL9K_BATTERY_LOW_FOREGROUND="9"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="172"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="46"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="46"

POWERLEVEL9K_BATTERY_LOW_BACKGROUND="237"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="237"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="237"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="237"

POWERLEVEL9K_BATTERY_STAGES="▁▂▃▄▅▆▇█"
POWERLEVEL9K_BATTERY_BACKGROUND="white"
POWERLEVEL9K_BATTERY_VERBOSE="false"
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND="grey"

POWERLEVEL9K_PUBLIC_IP_FOREGROUND="black"
POWERLEVEL9K_PUBLIC_IP_BACKGROUND="cyan"
#############################################################

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-completions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

## syntax highlighting configs
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=44'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=81,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]='fg=117'
ZSH_HIGHLIGHT_STYLES[assign]='fg=192,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=201,bold'
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
alias vi="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
