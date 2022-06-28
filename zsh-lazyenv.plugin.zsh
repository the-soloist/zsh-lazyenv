if [[ $LAZYENV =~ "go" ]]; then
    source $ZSH_CUSTOM/plugins/zsh-lazyenv/autoload/goenv.zsh
fi

if [[ $LAZYENV =~ "java" ]]; then
    source $ZSH_CUSTOM/plugins/zsh-lazyenv/autoload/jenv.zsh
fi

if [[ $LAZYENV =~ "python" ]]; then
    source $ZSH_CUSTOM/plugins/zsh-lazyenv/autoload/pyenv.zsh
fi
