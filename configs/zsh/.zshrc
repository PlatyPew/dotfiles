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
BREW_PREFIX="/opt/homebrew"
if [[ $(uname -m) == "x86_64" ]]; then
    BREW_PREFIX="/usr/local"
fi

export PATH=$PATH:$BREW_PREFIX/bin
export PATH=$PATH:$BREW_PREFIX/sbin

export PATH=$PATH:$BREW_PREFIX/opt/llvm/bin
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
    macos
    tmux
    vi-mode
    web-search

    zsh-aliases-exa
    zsh-autopair
    zsh-autosuggestions
    zsh-defer
    zsh-syntax-highlighting
    zsh-vimode-visual
)
##############################################################

# Powerlevel10k configs ######################################
ZSH_THEME="powerlevel10k/powerlevel10k"

source $HOME/dotfiles/configs/zsh/.p10k.zsh
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
