# XDG dir setting
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# Zsh config
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
export HISTFILE=$ZSH_CACHE/.zhistory

# Rust
export RUSTUP_UPDATE_ROOT=https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
## Join .cargo/bin/ 
PATH+=:$HOME/.cargo/bin

# Use msedge
export BROWSER='/mnt/c/Program\\ Files\\ \\(x86\\)/Microsoft/Edge/Application/msedge.exe'
