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

export PATH=$BREW_PREFIX/bin:$PATH
export PATH=$BREW_PREFIX/sbin:$PATH

export PATH=$PATH:$BREW_PREFIX/opt/llvm/bin
############################################################

local zshrc=$HOME/.zshrc
export DOTFILES=${zshrc:A:h:h:h}

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

# Plugins ####################################################
ZSH_DISABLE_COMPFIX=true

source "${HOME}/.zgenom/zgenom.zsh"

if ! zgenom saved; then
    zgenom ohmyzsh

    zgenom ohmyzsh plugins/autojump
    zgenom ohmyzsh plugins/brew
    zgenom ohmyzsh plugins/colored-man-pages
    zgenom ohmyzsh plugins/docker
    zgenom ohmyzsh plugins/extract
    zgenom ohmyzsh plugins/macos
    zgenom ohmyzsh plugins/vi-mode

    zgenom load DarrinTisdale/zsh-aliases-exa
    zgenom load hlissner/zsh-autopair
    zgenom load zsh-users/zsh-autosuggestions
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load b4b4r07/zsh-vimode-visual
    zgenom load romkatv/zsh-defer

    zgenom load romkatv/powerlevel10k powerlevel10k

    zgenom save
fi
##############################################################

# Powerlevel10k configs ######################################
source $HOME/dotfiles/configs/zsh/.p10k.zsh
#############################################################

## Syntax highlighting configs ##############################
 typeset -g ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
 typeset -g ZSH_HIGHLIGHT_STYLES[arg0]='fg=10,bold'
 typeset -g ZSH_HIGHLIGHT_STYLES[redirection]='fg=14'
 typeset -g ZSH_HIGHLIGHT_STYLES[globbing]='fg=6'
 typeset -g ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=11'
 typeset -g ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=11'
 typeset -g ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=15'
 typeset -g ZSH_HIGHLIGHT_STYLES[path]='fg=12'
 typeset -g ZSH_HIGHLIGHT_STYLES[assign]='fg=3,bold'
 typeset -g ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=13,bold'
 typeset -g ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=220,bold'
 typeset -g ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=220,bold'

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
source $DOTFILES/configs/zsh/.zsh_profile
############################################################
