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

# Set ls colours ###########################################
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
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
DISABLE_AUTO_UPDATE=true

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
