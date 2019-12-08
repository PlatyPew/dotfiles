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
ZSH_DISABLE_COMPFIX="true"

# Plugins ####################################################
plugins=(
    autojump
    brew
    colored-man-pages
    docker
    extract
    git
    osx
    sudo
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

# Disable highlight on paste
zle_highlight+=(paste:none)
############################################################

## Autosuggestions config ##################################
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
# Disables lag
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
############################################################

## Python2 #################################################
ve() {
    if [[ -z ${VIRTUAL_ENV} ]]; then
        if [[ ! -d venv ]]; then
            virtualenv --system-site-packages venv
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

# List directories when directory is changed
chpwd() {
    ls -a
}

# Autocorrect previous command
eval $(thefuck --alias)
############################################################

## FZF functions ###########################################
f() {
    MYPATH="$HOME"
    if [ ! -z $1 ]
    then
        MYPATH="${1}"
    fi

    rg ${MYPATH} --files --hidden --no-ignore-vcs 2> /dev/null | fzf -m --ansi --preview '[[ $(file --mime {}) =~ binary ]] && echo $(basename {}) is a binary file \($(file --mime-type {} | cut -d ":" -f 2 | cut -c 2-)\) || (bat --color=always --style=header,grid --line-range :200 {})'
}

ff() {
    MYPATH="$(pwd)"
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
    MYPATH="$(pwd)"
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
        echo "Usage: ${0} <search term>"
        return
    fi
    local match=$(
      rg --trim --vimgrep --color=never --line-number "$1" 2> /dev/null |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    if [[ -n $file ]]; then
        nvim $file +$(echo "$match" | cut -d':' -f2)
    fi
}

export FZF_DEFAULT_COMMAND='rg $(pwd) --files --hidden --no-ignore-vcs -g "!.git/*" 2> /dev/null'
############################################################

## Aliases #################################################
alias vi="nvim -O"
alias :q='exit'
alias cls='clear'
alias speed='speed-test -v'
alias ls='exa --git'
alias cat='bat'
alias sed='gsed'
alias awk='gawk'
alias bar='brew bundle dump && brew bundle --force cleanup && rm Brewfile'
alias rtv='rtv --enable-media'
alias tg='telegram -N'
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

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

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

# Set locale ###############################################
export LC_ALL=en_US.UTF-8
############################################################

# Set default compilation flags ############################
export CC=clang
export CFLAGS='-fsanitize=signed-integer-overflow -fsanitize=undefined -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow'
############################################################

# Pwnbox2 Integration ######################################
pwn() {
    if [ -z ${1} ];then
        echo "Usage: ${0} <start,clean,list,enter> (container name)"
        return 1
    fi

    if [ -z "$(docker stats --no-stream 2> /dev/null)" ]; then
        echo "Docker daemon is not running!"
        return 1
    fi

    if [ ${1} != "list" ] && ([ -z ${1} ] || [ -z ${2} ]); then
        echo "Usage: ${0} <start,clean,list,enter> (container name)"
        return 1
    fi

    cd ~/PwnBox2 > /dev/null
    case ${1} in
        start)
            ./run.sh ${2}
            cd - > /dev/null
            ;;
        clean)
            ./clean.sh ${2}
            cd - > /dev/null
            ;;
        list)
            docker container ls -a --filter "ancestor=platypew/pwnbox2" --format "table {{.Names}}\t{{.Status}}\t{{.Size}}\t{{.RunningFor}}"
            cd - > /dev/null
            ;;
        enter)
            cd ~/PwnBox2/${2}
            ;;
        *)
            echo "Usage: ${0} <start,clean,list,enter> (container name)"
            return 1
            ;;
    esac
}
############################################################

# Kali VMware Integration ##################################
kali() {
    if [ -z ${1} ];then
        echo "Usage: ${0} <start,stop,reboot,enter>"
        return 1
    fi
    case ${1} in
        start)
            vmrun -T fusion start "${HOME}/Virtual Machines/Kali Wireless.vmwarevm/Kali Wireless.vmx" nogui
            ;;
        stop)
            vmrun -T fusion stop "${HOME}/Virtual Machines/Kali Wireless.vmwarevm/Kali Wireless.vmx" soft
            ;;
        reboot)
            vmrun -T fusion reset "${HOME}/Virtual Machines/Kali Wireless.vmwarevm/Kali Wireless.vmx" soft
            ;;
        enter)
            ssh root@`vmrun getGuestIPAddress "${HOME}/Virtual Machines/Kali Wireless.vmwarevm/Kali Wireless.vmx" -wait`
            ;;
        *)
            echo "Usage: ${0} <start,stop,reboot,enter>"
            return 1
            ;;
    esac
}
############################################################
