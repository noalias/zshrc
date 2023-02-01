if [[ $INSIDE_EMACS == 'vterm' ]] \
       && [[ -n ${EMACS_VTERM_PATH} ]] \
       && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-zsh.sh ]]; then
	source ${EMACS_VTERM_PATH}/etc/emacs-vterm-zsh.sh
fi

export ZIM_HOME=$XDG_CACHE_HOME/zim

# Extra completions
local COMPLETION_EXTRA=${ZIM_HOME}/modules/completion-extra
if [[ ! -d $COMPLETION_EXTRA ]]; then
    mkdir -p $COMPLETION_EXTRA/src
fi

for f in _{rustup,cargo}; do
    [[ ! -f $COMPLETION_EXTRA/src/$f ]] && \
        case $f in
            _rustup)
                rustup completions zsh > $COMPLETION_EXTRA/src/$f
                ;;
            _cargo)
                rustup completions zsh cargo > $COMPLETION_EXTRA/src/$f
                ;;
        esac
done

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi


# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# Completion
zstyle ':zim:completion' dumpfile "${ZSH_CACHE_DIR}/.zcompdump"
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_HOME}/.zcompcache"

# pacman
zstyle ':zim:pacman' helpers 'aur'
