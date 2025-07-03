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
    my_autojump_version
    my_bat_version
    my_brew_version
    my_deno_version
    my_podman_version
    my_eza_version
    my_fzf_version
    my_git_version
    my_node_version
    my_nvim_version
    my_python_version
    my_ripgrep_version
    my_rust_version
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

  typeset -g POWERLEVEL9K_MY_AUTOJUMP_VERSION_SHOW_ON_COMMAND="autojump|j"
  typeset -g POWERLEVEL9K_MY_AUTOJUMP_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_BAT_VERSION_SHOW_ON_COMMAND="bat"
  typeset -g POWERLEVEL9K_MY_BAT_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_BREW_VERSION_SHOW_ON_COMMAND="brew"
  typeset -g POWERLEVEL9K_MY_BREW_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_DENO_VERSION_SHOW_ON_COMMAND="deno"
  typeset -g POWERLEVEL9K_MY_DENO_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_PODMAN_VERSION_SHOW_ON_COMMAND="podman"
  typeset -g POWERLEVEL9K_MY_PODMAN_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_EZA_VERSION_SHOW_ON_COMMAND="eza"
  typeset -g POWERLEVEL9K_MY_EZA_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_FZF_VERSION_SHOW_ON_COMMAND="fzf|ff|ft|fd"
  typeset -g POWERLEVEL9K_MY_FZF_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_GIT_VERSION_SHOW_ON_COMMAND="git"
  typeset -g POWERLEVEL9K_MY_GIT_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_NODE_VERSION_SHOW_ON_COMMAND="node"
  typeset -g POWERLEVEL9K_MY_NODE_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_NVIM_VERSION_SHOW_ON_COMMAND="nvim"
  typeset -g POWERLEVEL9K_MY_NVIM_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_PYTHON_VERSION_SHOW_ON_COMMAND="python3"
  typeset -g POWERLEVEL9K_MY_PYTHON_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_RIPGREP_VERSION_SHOW_ON_COMMAND="rg"
  typeset -g POWERLEVEL9K_MY_RIPGREP_VERSION_RIGHT_SEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_MY_RUST_VERSION_SHOW_ON_COMMAND="rustc|cargo"
  typeset -g POWERLEVEL9K_MY_RUST_VERSION_RIGHT_SEGMENT_SEPARATOR=''

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

  function _autojump_version() {
    local content
    [[ -f "/opt/homebrew/bin/autojump" ]] && content="$(autojump -v 2>&1 | cut -c 11-)" || content=
    typeset -g _prompt_autojump_version=$content
  }
  function prompt_my_autojump_version() {
    [ -z $_prompt_autojump_version ] && zsh-defer -a _autojump_version
    p10k segment -f 7 -b "" -i "󱉆 " -c $_prompt_autojump_version -t $_prompt_autojump_version
  }

  function _bat_version() {
    local content
    [[ -f "/opt/homebrew/bin/bat" ]] && content="$(bat -V | cut -c 5-)" || content=
    typeset -g _prompt_bat_version=$content
  }
  function prompt_my_bat_version() {
    [ -z $_prompt_bat_version ] && zsh-defer -a _bat_version
    p10k segment -f 11 -b "" -i " " -c $_prompt_bat_version -t $_prompt_bat_version
  }

  function _brew_version() {
    local content
    [[ -f "/opt/homebrew/bin/brew" ]] && content="$(brew -v | cut -c 10- | cut -d '-' -f 1)" || content=
    typeset -g _prompt_brew_version=$content
  }
  function prompt_my_brew_version() {
    [ -z $_prompt_brew_version ] && zsh-defer -a _brew_version
    p10k segment -f 9 -b "" -i " " -c $_prompt_brew_version -t $_prompt_brew_version
  }

  function _deno_version() {
    local content
    [[ -f "/opt/homebrew/bin/deno" ]] && content="$(deno -v | cut -c 6-)" || content=
    typeset -g _prompt_deno_version=$content
  }
  function prompt_my_deno_version() {
    [ -z $_prompt_deno_version ] && zsh-defer -a _deno_version
    p10k segment -f 15 -b "" -i " " -c $_prompt_deno_version -t $_prompt_deno_version
  }

  function _podman_version() {
    local content
    [[ -f "/opt/homebrew/bin/podman" ]] && content="$(podman -v | cut -d ' ' -f 3)" || content=
    typeset -g _prompt_podman_version=$content
  }
  function prompt_my_podman_version() {
    [ -z $_prompt_podman_version ] && zsh-defer -a _podman_version
    p10k segment -f 5 -b "" -i " " -c $_prompt_podman_version -t $_prompt_podman_version
  }

  function _eza_version() {
    local content
    [[ -f "/opt/homebrew/bin/eza" ]] && content="$(eza -v | sed -n '2p' | cut -d ' ' -f 1 | cut -c 2-)" || content=
    typeset -g _prompt_eza_version=$content
  }
  function prompt_my_eza_version() {
    [ -z $_prompt_eza_version ] && zsh-defer -a _eza_version
    p10k segment -f 5 -b "" -i " " -c $_prompt_eza_version -t $_prompt_eza_version
  }

  function _fzf_version() {
    local content
    [[ -f "/opt/homebrew/bin/fzf" ]] && content="$(fzf --version | cut -d ' ' -f 1)" || content=
    typeset -g _prompt_fzf_version=$content
  }
  function prompt_my_fzf_version() {
    [ -z $_prompt_fzf_version ] && zsh-defer -a _fzf_version
    p10k segment -f 14 -b "" -i "󰈞 " -c $_prompt_fzf_version -t $_prompt_fzf_version
  }

  function _git_version() {
    local content
    [[ -f "/opt/homebrew/bin/git" ]] && content="$(git -v | cut -d ' ' -f 3)" || content=
    typeset -g _prompt_git_version=$content
  }
  function prompt_my_git_version() {
    [ -z $_prompt_git_version ] && zsh-defer -a _git_version
    p10k segment -f 9 -b "" -i " " -c $_prompt_git_version -t $_prompt_git_version
  }

  function _node_version() {
    local content
    [[ -f "/opt/homebrew/bin/node" ]] && content="$(node -v | cut -c 2-)" || content=
    typeset -g _prompt_node_version=$content
  }
  function prompt_my_node_version() {
    [ -z $_prompt_node_version ] && zsh-defer -a _node_version
    p10k segment -f 2 -b "" -i " " -c $_prompt_node_version -t $_prompt_node_version
  }

  function _nvim_version() {
    local content
    [[ -f "/opt/homebrew/bin/nvim" ]] && content="$(nvim -v | head -n1 | cut -c 7-)" || content=
    typeset -g _prompt_nvim_version=$content
  }
  function prompt_my_nvim_version() {
    [ -z $_prompt_nvim_version ] && zsh-defer -a _nvim_version
    p10k segment -f 10 -b "" -i " " -c $_prompt_nvim_version -t $_prompt_nvim_version
  }

  function _python_version() {
    local content
    [[ -f "/opt/homebrew/bin/python3" ]] && content="$(python3 -V | cut -c 8-)" || content=
    typeset -g _prompt_python_version=$content
  }
  function prompt_my_python_version() {
    [ -z $_prompt_python_version ] && zsh-defer -a _python_version
    p10k segment -f 4 -b "" -i " " -c $_prompt_python_version -t $_prompt_python_version
  }

  function _ripgrep_version() {
    local content
    [[ -f "/opt/homebrew/bin/rg" ]] && content="$(rg -V | cut -c 9-)" || content=
    typeset -g _prompt_ripgrep_version=$content
  }
  function prompt_my_ripgrep_version() {
    [ -z $_prompt_ripgrep_version ] && zsh-defer -a _ripgrep_version
    p10k segment -f 1 -b "" -i "󰮗 " -c $_prompt_ripgrep_version -t $_prompt_ripgrep_version
  }

  function _rust_version() {
    local content
    [[ -f "/opt/homebrew/bin/rustc" ]] && content="$(rustc -V | cut -d ' ' -f 2)" || content=
    typeset -g _prompt_rust_version=$content
  }
  function prompt_my_rust_version() {
    [ -z $_prompt_rust_version ] && zsh-defer -a _rust_version
    p10k segment -f 9 -b "" -i " " -c $_prompt_rust_version -t $_prompt_rust_version
  }

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'

# vim: ft=bash
