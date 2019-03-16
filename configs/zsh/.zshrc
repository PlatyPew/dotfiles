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

# 256 colour support
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$(echo ~$USER)/.oh-my-zsh"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins ####################################################
plugins=(
    git
    zsh-syntax-highlighting
    brew
    colored-man-pages
    docker
    osx
    vi-mode
    web-search
    sudo
    tmux
    extract
    autojump
    zsh-autosuggestions
)
##############################################################

# Powerlevel9k configs #######################################
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv os_icon user_joined dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status date time_joined battery)

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

POWERLEVEL9K_DATE_FORMAT="%D{%d-%b-%y}"

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

source $ZSH/oh-my-zsh.sh

## Syntax highlighting configs ##############################
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[arg0]='fg=10,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=44,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=81,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=226,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]='fg=117'
ZSH_HIGHLIGHT_STYLES[assign]='fg=192,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=135,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=220,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=220,bold'
############################################################

## Autosuggestions config ##################################
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
############################################################

## Python ##################################################
ve() {
    if [[ -z ${VIRTUAL_ENV} ]]; then
        if [[ ! -d venv ]]; then
            virtualenv -p python3 venv
            source venv/bin/activate
        else
            source venv/bin/activate
        fi
        echo "python:  $(which python)"
        echo "python3: $(which python3)"
        echo "pip:     $(which pip)"
        echo "pip3:    $(which pip3)"
    else
        echo "You are already in a virtual environment"
        return 1
    fi
}

alias de='deactivate'
############################################################

## Misc Functions ##########################################
# Get Weather
weather() {
    sed '$ d' <(curl -s wttr.in/${1} | grep -v '@igor');
}

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
        echo "Example:  ${0} c \"get string length\""
        echo "          ${0} python \"~file\" # Uses keyword \"file\""
        echo "          ${0} -l # Shows list of all topics"
        return 1
    elif [ ${1} = "-l" ]; then
        curl -s "https://cht.sh/:list" | grep -v '[/:]' | xargs -s 100 | tr " " "\t"
    else
        topic=${1}
        shift
        time curl -s "https://cht.sh/${topic}/${*}/i"
    fi
}

# Super docs
dash() {
    if [[ "$OSTYPE" != "darwin"* ]] then
        echo "Only available for MacOS :("
        return 1
    fi

    if [[ ${1} == "-h" ]] then
        echo "Usage:    ${0} [-h] <doc> [query]"
        echo "Example:  ${0} python3 \"subprocess\"   # Shows docs from Python 3 subprocess"
        echo "          ${0} c \"format\"             # Shows docs from C printf"
        echo "          ${0} promises               # Shows docs for promises"
        return 0
    fi

    DOC=${1}
    if [[ -z ${2} ]] then
        open "dash-plugin://query=${DOC}"
    else
        shift
        open "dash-plugin://keys=${DOC}&query=${*}"
    fi

    if [[ $? -ne 0 ]] then
        echo "You may not have dash installed. Install by doing: brew cask install dash"
        return 1
    fi
}

# Get rates of crypto currency
rate() {
    curl -s "https://sgd.rate.sx/${1}" | grep -v '@igor'
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
############################################################

## FZF functions ###########################################
f() {
    rg ~ --files --hidden --no-ignore-vcs -g '!.git/*' 2> /dev/null | fzf --ansi -q "${1}" --preview '[[ $(file --mime {}) =~ binary ]] && echo $(basename {}) is a binary file \($(file --mime-type {} | cut -d ":" -f 2 | cut -c 2-)\) || (bat --color=always --style=header,grid --line-range :200 {})'
}

ff() {
    FILE=$(rg $(pwd) --files --hidden --no-ignore-vcs -g '!.git/*' 2> /dev/null | fzf --ansi -q "${1}" --preview '[[ $(file --mime {}) =~ binary ]] && echo $(basename {}) is a binary file \($(file --mime-type {} | cut -d ":" -f 2 | cut -c 2-)\) || (bat --color=always --style=header,grid --line-range :200 {})')
    if [ ! -z $FILE ]
    then
        nvim "${FILE}"
    fi
}

fd() {
    DIR="$(find ~ -type d -name ".git" -prune -o -type d -print 2> /dev/null | fzf -q "${1}" --ansi --preview 'exa -T --level 1 --color always {}')"

    if [ ! -z $DIR ]
    then
        cd "${DIR}"
    fi
}
############################################################

## Aliases #################################################
alias vi="nvim -O"
alias :q='exit'
alias cls='clear'
alias speed='speed-test -v'
alias ls='exa --git'
alias cat='bat'
############################################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
############################################################

export FZF_DEFAULT_COMMAND='rg $(pwd) --files --hidden --no-ignore-vcs -g "!.git/*" 2> /dev/null'
