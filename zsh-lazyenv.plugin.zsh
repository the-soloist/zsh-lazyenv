# zsh-lazyenv - Lazy load development environment managers
#
# Configuration (set in .zshrc before plugins are loaded):
#   LAZYENV                - colon-separated list of managers to load (e.g., "goenv:jenv:pyenv")
#   GOENV_ROOT             - goenv install path (default: ~/.goenv)
#   GOENV_GOPATH_PREFIX    - goenv GOPATH prefix
#   JENV_ROOT              - jenv install path (default: ~/.jenv)
#   PYENV_ROOT             - pyenv install path (default: ~/.pyenv)
#   ZSH_PYENV_LAZY_VIRTUALENV - set to enable pyenv-virtualenv lazy init

_lazyenv_init() {
  local cmd="$1" root_var="$2" default_root="$3"
  local root="${(P)root_var:-$default_root}"
  export "$root_var"="$root"

  if ! type "$cmd" >/dev/null 2>&1 && [[ -f "$root/bin/$cmd" ]]; then
    export PATH="$root/bin:$PATH"
  fi

  if type "$cmd" >/dev/null 2>&1; then
    export PATH="$root/shims:$PATH"
    eval "function $cmd() { unset -f $cmd; eval \"\$(command $cmd init -)\"; $cmd \"\$@\" }"
  fi
}

[[ "$LAZYENV" == *goenv* ]] && _lazyenv_init goenv GOENV_ROOT "$HOME/.goenv"
[[ "$LAZYENV" == *jenv*  ]] && _lazyenv_init jenv  JENV_ROOT  "$HOME/.jenv"
[[ "$LAZYENV" == *pyenv* ]] && {
  _lazyenv_init pyenv PYENV_ROOT "$HOME/.pyenv"
  if [[ -n "$ZSH_PYENV_LAZY_VIRTUALENV" ]] && type pyenv >/dev/null 2>&1; then
    local _orig="$(which pyenv)"
    eval "function pyenv() { unset -f pyenv; eval \"\$(command pyenv init -)\"; eval \"\$(command pyenv virtualenv-init -)\"; pyenv \"\$@\" }"
  fi
}

unfunction _lazyenv_init
