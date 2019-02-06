# Path to the bash it configuration
export BASH_IT="/Users/daryllim/.bash_it"

# location /.bash_it/themes/
export BASH_IT_THEME='powerline'

# Don't check mail when opening terminal.
unset MAILCHECK

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=false

# Load Bash It
source "$BASH_IT"/bash_it.sh

## Python #####################################################
ve() {
    if [[ -z ${VIRTUAL_ENV} ]]; then
        if [[ ! -d venv ]]; then
            virtualenv -p python3 venv
            source venv/bin/activate
            pip3 install --upgrade neovim
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
###############################################################

## Functions ##################################################
google() {
    zsh -c "source ~/.zshrc && web_search google ${*}"
}

ddg() {
    zsh -c "source ~/.zshrc && web_search duckduckgo ${*}"
}

howdafak() {
    zsh -c "source ~/.zshrc && howdafak ${*}"
}
###############################################################

## Aliases ####################################################
alias :q=exit
alias cls="clear"
alias vi="nvim -O"
###############################################################

## ZSH like search
if [[ $- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
