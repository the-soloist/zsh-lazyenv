# zsh-lazyenv

Oh-My-Zsh plugin for lazy loading development environment managers. Consolidates [jenv-lazy](https://github.com/shihyuho/zsh-jenv-lazy), [pyenv-lazy](https://github.com/davidparsson/zsh-pyenv-lazy), [goenv-lazy](https://github.com/kadaan/zsh-goenv-lazy).

## Install

Clone to oh-my-zsh custom plugins directory:

```sh
git clone https://github.com/the-soloist/zsh-lazyenv.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-lazyenv
```

Add `zsh-lazyenv` to plugins in `.zshrc`:

```sh
plugins=(... zsh-lazyenv)
```

## Configuration

Set before plugins are loaded in `.zshrc`:

```sh
# Select which env managers to lazy load (colon-separated)
export LAZYENV="goenv:jenv:pyenv"

# Root directories for each manager
export GOENV_ROOT="/path/to/goenv"
export GOENV_GOPATH_PREFIX="/path/to/goenv/home"
export JENV_ROOT="/path/to/jenv"
export PYENV_ROOT="/path/to/pyenv"
```

## Supported Managers

| Manager | Description |
|---------|-------------|
| goenv | Go version management |
| jenv | Java version management |
| pyenv | Python version management |
