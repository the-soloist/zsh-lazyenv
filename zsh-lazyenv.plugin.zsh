if [[ $LAZYENV =~ "goenv" ]]; then
    source $ZSH_CUSTOM/plugins/zsh-lazyenv/autoload/goenv.zsh
fi

if [[ $LAZYENV =~ "jenv" ]]; then
    source $ZSH_CUSTOM/plugins/zsh-lazyenv/autoload/jenv.zsh
fi

if [[ $LAZYENV =~ "pyenv" ]]; then
    source $ZSH_CUSTOM/plugins/zsh-lazyenv/autoload/pyenv.zsh
fi
