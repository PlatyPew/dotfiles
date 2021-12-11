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

  typeset -g POWERLEVEL9K_MODE="nerdfont-complete"

  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND="11"
  typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND="26"

  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND="11"
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND="26"

  typeset -g POWERLEVEL9K_USER_DEFAULT_FOREGROUND="15"
  typeset -g POWERLEVEL9K_USER_DEFAULT_BACKGROUND="8"

  typeset -g POWERLEVEL9K_SSH_FOREGROUND="11"
  typeset -g POWERLEVEL9K_SSH_BACKGROUND="8"

  typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND="15"
  typeset -g POWERLEVEL9K_DIR_HOME_BACKGROUND="4"
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="15"
  typeset -g POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="4"
  typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="15"
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

  typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND="10"
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="10"
  typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="11"

  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND="15"
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=""

  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=""
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_JAVA_VERSION_SHOW_ON_COMMAND="java|javac|jar"
  typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND="196"
  typeset -g POWERLEVEL9K_JAVA_VERSION_BACKGROUND=""
  typeset -g POWERLEVEL9K_JAVA_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_NODE_VERSION_SHOW_ON_COMMAND="node"
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND="2"
  typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=""
  typeset -g POWERLEVEL9K_NODE_VERSION_RIGHT_SEGMENT_SEPARATOR=''

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

  typeset -g POWERLEVEL9K_LOAD_BACKGROUND="11"

  typeset -g POWERLEVEL9K_RAM_BACKGROUND="11"

  typeset -g POWERLEVEL9K_WIFI_BACKGROUND="6"

  function p10k-on-pre-prompt() {
      p10k display '1'=show 'empty_line'=hide '*/load'=show '*/ram'=show '*/wifi'=show
  }
  function p10k-on-post-prompt() {
      [[ $P9K_TTY == old ]] && p10k display '1'=hide 'empty_line'=show '*/load'=hide '*/ram'=hide '*/wifi'=hide
  }

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
