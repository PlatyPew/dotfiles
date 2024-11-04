ZLE_RPROMPT_INDENT=0

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  autoload -Uz is-at-least && is-at-least 5.1 || return

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

  # Left prompt segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    anaconda
    virtualenv
    ssh
    user_joined
    dir
    vcs
    newline
    os_icon
    prompt_char_joined
  )

  # Right prompt segments.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    my_brew_version
    my_docker_version
    my_git_version
    my_nvim_version
    my_python_version
    my_pip_version
    java_version

    background_jobs
    date
    time_joined
    battery
    newline
    load
    ram_joined
    wifi
  )

  typeset -g POWERLEVEL9K_MODE="nerdfont-complete"

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  typeset -g POWERLEVEL9K_STATUS_VERBOSE=false
  typeset -g POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=""

  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=""
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE="true"

  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND="3"
  typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND="26"

  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND="3"
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND="26"

  typeset -g POWERLEVEL9K_USER_DEFAULT_FOREGROUND="7"
  typeset -g POWERLEVEL9K_USER_DEFAULT_BACKGROUND="8"

  typeset -g POWERLEVEL9K_SSH_FOREGROUND="11"
  typeset -g POWERLEVEL9K_SSH_BACKGROUND="8"

  typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND="0"
  typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND="4"
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="0"
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="4"
  typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="0"
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND="10"
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="10"
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="11"

  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND="15"
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=""

  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=""
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_BREW_VERSION_SHOW_ON_COMMAND="brew"
  typeset -g POWERLEVEL9K_MY_BREW_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_DOCKER_VERSION_SHOW_ON_COMMAND="docker"
  typeset -g POWERLEVEL9K_MY_DOCKER_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_GIT_VERSION_SHOW_ON_COMMAND="git"
  typeset -g POWERLEVEL9K_MY_GIT_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_NVIM_VERSION_SHOW_ON_COMMAND="nvim"
  typeset -g POWERLEVEL9K_MY_NVIM_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_PYTHON_VERSION_SHOW_ON_COMMAND="python3"
  typeset -g POWERLEVEL9K_MY_PYTHON_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_PIP_VERSION_SHOW_ON_COMMAND="pip3"
  typeset -g POWERLEVEL9K_MY_PIP_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_JAVA_VERSION_SHOW_ON_COMMAND="java|javac|jar"
  typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND="9"
  typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND=""
  typeset -g POWERLEVEL9K_JAVA_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="6"
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="0"

  typeset -g POWERLEVEL9K_DATE_FORMAT="7"
  typeset -g POWERLEVEL9K_DATE_FORMAT="%D{%d-%b-%y}"

  typeset -g POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"

  typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND="9"
  typeset -g POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="172"
  typeset -g POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="2"
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="2"

  typeset -g POWERLEVEL9K_BATTERY_LOW_BACKGROUND="0"
  typeset -g POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="0"
  typeset -g POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="0"
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="0"

  typeset -g POWERLEVEL9K_BATTERY_STAGES="▁▂▃▄▅▆▇█"
  typeset -g POWERLEVEL9K_BATTERY_BACKGROUND="7"
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE="false"
  typeset -g POWERLEVEL9K_BATTERY_LEVEL_BACKGROUND="grey"

  typeset -g POWERLEVEL9K_LOAD_BACKGROUND="3"

  typeset -g POWERLEVEL9K_RAM_BACKGROUND="3"

  typeset -g POWERLEVEL9K_WIFI_BACKGROUND="6"

  function p10k-on-pre-prompt() {
    p10k display '1'=show 'empty_line'=hide '*/load'=show '*/ram'=show '*/wifi'=show
  }
  function p10k-on-post-prompt() {
    [[ $P9K_TTY == old ]] && p10k display '1'=hide 'empty_line'=show '*/load'=hide '*/ram'=hide '*/wifi'=hide
  }

  typeset -g _brew_version
  typeset -g _docker_version
  typeset -g _git_version
  typeset -g _nvim_version
  typeset -g _python_version
  typeset -g _pip_version

  function _brew_version() {
    local content
    [[ -f "/opt/homebrew/bin/brew" ]] && content="$(brew --version | head -n 1 | cut -d ' ' -f 2)" || content=
    _brew_version=$content
  }

  function _docker_version() {
    local content
    [[ -f "/usr/local/bin/docker" ]] && content="$(docker -v | cut -d ' ' -f 3 | sed 's/.$//')" || content=
    _docker_version=$content
  }

  function _git_version() {
    local content
    [[ -f "/opt/homebrew/bin/git" ]] && content="$(git --version | cut -d ' ' -f 3)" || content=
    _git_version=$content
  }

  function _nvim_version() {
    local content
    [[ -f "/opt/homebrew/bin/nvim" ]] && content="$(nvim --version | cut -d 'v' -f 2 | head -n 1)" || content=
    _nvim_version=$content
  }

  function _python_version() {
    local content
    [[ -f "/opt/homebrew/bin/python3" ]] && content="$(python3 -V | cut -d ' ' -f 2)" || content=
    _python_version=$content
  }

  function _pip_version() {
    local content
    [[ -f "/opt/homebrew/bin/pip3" ]] && content="$(pip3 --version | cut  -d ' ' -f 2)" || content=
    _pip_version=$content
  }

  function prompt_my_brew_version() {
    [ -z $_brew_version ] && zsh-defer -a _brew_version
    p10k segment -f 9 -b "" -i " " -c $_brew_version -t $_brew_version
  }

  function prompt_my_docker_version() {
    [ -z $_docker_version ] && zsh-defer -a _docker_version
    p10k segment -f 4 -b "" -i " " -c $_docker_version -t $_docker_version
  }

  function prompt_my_git_version() {
    [ -z $_git_version ] && zsh-defer -a _git_version
    p10k segment -f 9 -b "" -i " " -c $_git_version -t $_git_version
  }

  function prompt_my_nvim_version() {
    [ -z $_nvim_version ] && zsh-defer -a _nvim_version
    p10k segment -f 10 -b "" -i " " -c $_nvim_version -t $_nvim_version
  }

  function prompt_my_python_version() {
    [ -z $_python_version ] && zsh-defer -a _python_version
    p10k segment -f 4 -b "" -i " " -c $_python_version -t $_python_version
  }

  function prompt_my_pip_version() {
    [ -z $_pip_version ] && zsh-defer -a _pip_version
    p10k segment -f 4 -b "" -i " " -c $_pip_version -t $_pip_version
  }

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'

# vim: ft=bash
