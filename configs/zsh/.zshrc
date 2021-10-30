# ▒███████▒  ██████  ██░ ██  ██▀███   ▄████
# ▒ ▒ ▒ ▄▀░▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█
# ░ ▒ ▄▀▒░ ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄
#   ▄▀▒   ░  ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
# ▒███████▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
# ░▒▒ ▓░▒░▒▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
# ░░▒ ▒ ░ ▒░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒
# ░ ░ ░ ░ ░░  ░  ░   ░  ░░ ░  ░░   ░ ░
#   ░ ░          ░   ░  ░  ░   ░     ░ ░
# ░                                  ░

# 256 colour support #######################################
export TERM="xterm-256color"
############################################################

# Set locale ###############################################
export LC_ALL=en_US.UTF-8
############################################################

# Set editor ###############################################
export EDITOR=nvim
############################################################

# Path for homebrew ########################################
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH

export BREW_PREFIX=$(brew --prefix)

export PATH=$BREW_PREFIX/opt/llvm/bin:$PATH
############################################################

# Path to your oh-my-zsh installation.
export ZSH="$(echo ~$USER)/.oh-my-zsh"
# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# Instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_DISABLE_COMPFIX="true"

DISABLE_AUTO_UPDATE="true"

# Plugins ####################################################
plugins=(
    autojump
    brew
    colored-man-pages
    docker
    extract
    git
    osx
    tmux
    vi-mode
    web-search

    zsh-aliases-exa
    zsh-autopair
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vimode-visual
)
##############################################################

# Powerlevel10k configs ######################################
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_DIR_SHOW_WRITABLE="true"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv ssh user_joined dir vcs newline os_icon prompt_char_joined)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    custom_brew_version
    custom_docker_version
    custom_git_version
    custom_nvim_version
    custom_python2_version
    custom_python_version
    custom_pip_version
    java_version
    node_version
    custom_npm_version

    background_jobs
    date
    time_joined
    battery
    newline
    load
    ram_joined
    wifi
)

POWERLEVEL9K_VIRTUALENV_FOREGROUND="11"
POWERLEVEL9K_VIRTUALENV_BACKGROUND="26"

POWERLEVEL9K_USER_DEFAULT_FOREGROUND="15"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="8"

POWERLEVEL9K_SSH_FOREGROUND="11"
POWERLEVEL9K_SSH_BACKGROUND="8"

POWERLEVEL9K_DIR_HOME_FOREGROUND="15"
POWERLEVEL9K_DIR_HOME_BACKGROUND="4"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="15"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="4"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="15"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_VCS_CLEAN_BACKGROUND="10"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="10"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="11"

POWERLEVEL9K_OS_ICON_FOREGROUND="15"
POWERLEVEL9K_OS_ICON_BACKGROUND=""

POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=""
POWERLEVEL9K_PROMPT_CHAR_LEFT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_BREW_VERSION="echo \"$(brew --version | head -n 1 | cut -d ' ' -f 2)  \""
POWERLEVEL9K_CUSTOM_BREW_VERSION_SHOW_ON_COMMAND="brew"
POWERLEVEL9K_CUSTOM_BREW_VERSION_FOREGROUND="9"
POWERLEVEL9K_CUSTOM_BREW_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_BREW_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_DOCKER_VERSION="echo \"$(docker -v | cut -d ' ' -f 3 | sed 's/.$//')  \""
POWERLEVEL9K_CUSTOM_DOCKER_VERSION_SHOW_ON_COMMAND="docker"
POWERLEVEL9K_CUSTOM_DOCKER_VERSION_FOREGROUND="4"
POWERLEVEL9K_CUSTOM_DOCKER_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_DOCKER_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_GIT_VERSION="echo \"$(git --version | cut -d ' ' -f 3) \""
POWERLEVEL9K_CUSTOM_GIT_VERSION_SHOW_ON_COMMAND="git"
POWERLEVEL9K_CUSTOM_GIT_VERSION_FOREGROUND="9"
POWERLEVEL9K_CUSTOM_GIT_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_GIT_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_NVIM_VERSION="echo \"$(nvim --version | cut -d ' ' -f 2 | head -n 1) \""
POWERLEVEL9K_CUSTOM_NVIM_VERSION_SHOW_ON_COMMAND="nvim"
POWERLEVEL9K_CUSTOM_NVIM_VERSION_FOREGROUND="10"
POWERLEVEL9K_CUSTOM_NVIM_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_NVIM_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_PYTHON2_VERSION="echo \"$(python2 -V 2>&1 | cut -d ' ' -f 2) \""
POWERLEVEL9K_CUSTOM_PYTHON2_VERSION_SHOW_ON_COMMAND="python2"
POWERLEVEL9K_CUSTOM_PYTHON2_VERSION_FOREGROUND="4"
POWERLEVEL9K_CUSTOM_PYTHON2_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_PYTHON2_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_PYTHON_VERSION="echo \"$(python3 -V | cut -d ' ' -f 2) \""
POWERLEVEL9K_CUSTOM_PYTHON_VERSION_SHOW_ON_COMMAND="python3"
POWERLEVEL9K_CUSTOM_PYTHON_VERSION_FOREGROUND="4"
POWERLEVEL9K_CUSTOM_PYTHON_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_PYTHON_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_PIP_VERSION="echo \"$(pip3 --version | cut  -d ' ' -f 2)  \""
POWERLEVEL9K_CUSTOM_PIP_VERSION_SHOW_ON_COMMAND="pip3"
POWERLEVEL9K_CUSTOM_PIP_VERSION_FOREGROUND="4"
POWERLEVEL9K_CUSTOM_PIP_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_PIP_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_JAVA_VERSION_SHOW_ON_COMMAND="java|javac|jar"
POWERLEVEL9K_JAVA_VERSION_FOREGROUND="196"
POWERLEVEL9K_JAVA_VERSION_BACKGROUND=""
POWERLEVEL9K_JAVA_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_NODE_VERSION_SHOW_ON_COMMAND="node"
POWERLEVEL9K_NODE_VERSION_FOREGROUND="2"
POWERLEVEL9K_NODE_VERSION_BACKGROUND=""
POWERLEVEL9K_NODE_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_CUSTOM_NPM_VERSION="echo \"$(npm --version)  \""
POWERLEVEL9K_CUSTOM_NPM_VERSION_SHOW_ON_COMMAND="npm"
POWERLEVEL9K_CUSTOM_NPM_VERSION_FOREGROUND="2"
POWERLEVEL9K_CUSTOM_NPM_VERSION_BACKGROUND=""
POWERLEVEL9K_CUSTOM_NPM_VERSION_RIGHT_SEGMENT_SEPARATOR=''

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="6"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="0"

POWERLEVEL9K_DATE_FORMAT="7"
POWERLEVEL9K_DATE_FORMAT="%D{%d-%b-%y}"

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

POWERLEVEL9K_BATTERY_LOW_FOREGROUND="9"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="172"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="2"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="2"

POWERLEVEL9K_BATTERY_LOW_BACKGROUND="0"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="0"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="0"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="0"

POWERLEVEL9K_BATTERY_STAGES="▁▂▃▄▅▆▇█"
POWERLEVEL9K_BATTERY_BACKGROUND="7"
POWERLEVEL9K_BATTERY_VERBOSE="false"
POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND="grey"

POWERLEVEL9K_LOAD_BACKGROUND="11"

POWERLEVEL9K_RAM_BACKGROUND="11"

POWERLEVEL9K_WIFI_BACKGROUND="6"

function p10k-on-pre-prompt() {
    p10k display '1'=show 'empty_line'=hide '*/load'=show '*/ram'=show '*/wifi'=show
}
function p10k-on-post-prompt() {
    [[ $P9K_TTY == old ]] && p10k display '1'=hide 'empty_line'=show '*/load'=hide '*/ram'=hide '*/wifi'=hide
}
#############################################################

source $ZSH/oh-my-zsh.sh

## Syntax highlighting configs ##############################
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=14'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=6'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=11'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=15'
ZSH_HIGHLIGHT_STYLES[path]='fg=12'
ZSH_HIGHLIGHT_STYLES[assign]='fg=3,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=13,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=220,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=220,bold'

# Disable highlight on paste
zle_highlight+=(paste:none)
############################################################

## Autosuggestions config ##################################
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
# Disables lag
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
############################################################

## Python3 #################################################
ve() {
    if [[ -z ${VIRTUAL_ENV} ]]; then
        if [[ ! -d venv ]]; then
            virtualenv venv
            source venv/bin/activate
        else
            source venv/bin/activate
        fi
        echo "python:  $(which python)"
        echo "pip:     $(which pip)"
    else
        echo "You are already in a virtual environment"
        return 1
    fi
}

alias de='deactivate'
alias pdb='python3 -m pdb'
alias python='python3'
alias pip='pip3'
alias n='navi'
############################################################

## Misc Functions ##########################################
# Convert text to QR code
qrcode() {
    if [ -z ${1} ]; then
        echo "Usage: ${0} <string>"
        return 1
    else
        printf "${1}" | curl -s -F-=\<- qrenco.de
    fi
}

# Ulimate cheat sheet
howdafak() {
    if [[ -z ${1} || "${1}" == "-h" ]] then
        echo "Usage:    ${0} [-l] <topic> [query]"
        echo "Example:  ${0} c \"get string length\"  # Shows how to get string length in C"
        echo "          ${0} python \"~file\"         # Uses keyword \"file\""
        echo "          ${0} -l                     # Shows list of all topics"
        return 1
    elif [ ${1} = "-l" ]; then
        curl -s "https://cht.sh/:list" | grep -v '[/:]' | xargs -s 100 | tr " " "\t"
    else
        topic=${1}
        shift
        time curl -s "https://cht.sh/${topic}/${*}/i"
    fi
}

# Spawn IDE like environment using Neovim
ide() {
    if [[ -z $TMUX ]] then
        SESSION='dev'
        tmux -2 new-session -d -s $SESSION
        tmux send-keys "nvim ${1} '+call ToggleIDE()'" C-m
        tmux -2 attach-session -t $SESSION
    else
        nvim ${1} '+call ToggleIDE()'
    fi
}

# List directories when directory is changed
chpwd() {
    exa -a --icons
}

## FZF functions ###########################################
f() {
    MYSEARCH="*"
    if [ ! -z $1 ]
    then
        MYSEARCH="${1}"
    fi

    locate "${MYSEARCH}" | fzf -m --ansi --preview '[[ $(file --mime {}) =~ binary ]] && echo $(basename {}) is a binary file \($(file --mime-type {} | cut -d ":" -f 2 | cut -c 2-)\) || (bat --color=always --style=header,grid --line-range :200 {})'
}

ff() {
    MYPATH="."
    if [ ! -z $1 ]
    then
        MYPATH="${1}"
    fi

        FILE=$(rg ${MYPATH} --files --hidden --no-ignore-vcs -g '!.git/*' 2> /dev/null | fzf --ansi --preview '[[ $(file --mime {}) =~ binary ]] && echo $(basename {}) is a binary file \($(file --mime-type {} | cut -d ":" -f 2 | cut -c 2-)\) || (bat --color=always --style=header,grid --line-range :200 {})')

    if [ ! -z $FILE ]
    then
        nvim "${FILE}"
    fi
}

fd() {
    MYPATH="."
    if [ ! -z $1 ]
    then
        MYPATH="${1}"
    fi

    DIR="$(find ${MYPATH} -type d -name ".git" -prune -o -type d -print 2> /dev/null | fzf --ansi --preview 'exa -T --level 1 --color always {}')"

    if [ ! -z $DIR ]
    then
        cd "${DIR}"
    fi
}

ft(){
    if [ -z ${1} ]
    then
        echo "Usage: ${0} <search term> [path]"
        return
    fi

    MYPATH="."
    if [ ! -z $2 ]
    then
        MYPATH="${2}"
    fi

    local match=$(
      rg --hidden --trim --vimgrep --color=never --line-number "$1" ${MYPATH} 2> /dev/null |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        nvim $file +$(echo "$match" | cut -d':' -f2)
    fi
}

export FZF_DEFAULT_COMMAND='rg $(pwd) --files --hidden --no-ignore-vcs -g "!.git/*" 2> /dev/null'
export BAT_THEME='TwoDark'
############################################################

## Ngrok ###################################################
# Publish a port online using ngrok
publish() {
    local USAGE() {
        printf "publish <start|stop|status> [port]\n"
    }

    if [ -z ${1} ]; then
        USAGE
        return 1
    fi

    if [ ${1} = "start" ]; then
        if [ -z ${2} ]; then
            USAGE
            return 1
        fi

        if [ ! -f "$HOME/.ngrok2/ngrok.yml" ]; then
            printf "Enter auth token: "
            read token
            ngrok authtoken $token
        fi

        ngrok tcp -log=stdout ${2} > /dev/null &
        export NGROK_PID=$!
        sleep 2
        export NGROK_PORT=${2}
        printf "Port forwarding 0.0.0.0:${NGROK_PORT} -> "
        curl -s http://localhost:4040/api/tunnels | python3 -c "import sys, json; print(json.load(sys.stdin)['tunnels'][0]['public_url'])" | cut -f 3 -d '/'
    elif [ ${1} = "stop" ]; then
        kill $NGROK_PID
        export NGROK_PORT=""
    elif [ ${1} = "status" ]; then
        printf "Port forwrding 0.0.0.0:${NGROK_PORT} -> "
        curl -s http://localhost:4040/api/tunnels | python3 -c "import sys, json; print(json.load(sys.stdin)['tunnels'][0]['public_url'])" | cut -f 3 -d '/'
    else
        USAGE
        return 1
    fi
}
############################################################

## Aliases #################################################
alias vi="nvim -O"
alias :q='exit'
alias cls='clear'
alias speed='speed-test -v'
alias ls='exa --git --icons'
alias cat='bat'
alias sed='gsed'
alias awk='gawk'
alias ql='quick-look'
############################################################

## Prevent a Darren ########################################
alias del='trash -F'
############################################################

## iTerm2 shell integration ################################
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
############################################################

## Vi-Mode ZSH #############################################
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Remove mode switching delay.
KEYTIMEOUT=5

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Allow for text objects
autoload -U select-bracketed select-quoted
zle -N select-bracketed
zle -N select-quoted
for km in viopp visual; do
    bindkey -M $km -- '-' vi-up-line-or-history
    for c in {a,i}{\',\",\`}; do
        bindkey -M $km $c select-quoted
    done
    for c in {a,i}${(s..):-'()[]{}<>bB'}; do
        bindkey -M $km $c select-bracketed
    done
done
############################################################

## Fix git completion ######################################
FILE=$BREW_PREFIX/share/zsh/site-functions/git-completion.bash
if [[ -f $FILE ]]
then
    rm -f $FILE
    rm -rf $BREW_PREFIX/share/zsh/site-functions/_git
fi
############################################################

## Fix tmux comment highlighting on vim ####################
[ ! -z "${TMUX+x}" ] && export TERM="screen-256color"
############################################################

## Additional stuff ########################################
source $HOME/.zsh_profile
############################################################
