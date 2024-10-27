# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "hlissner/zsh-autopair"
plug "MichaelAquilina/zsh-you-should-use"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/completions"
#plug "zsh-users/zsh-syntax-highlighting"

# Francinette
alias francinette="$HOME"/42porto/francinette/tester.sh
alias franci="francinette --strict"

# NeoVim
alias nv="nvim"

# Git
alias gc="git commit -m"
alias gg="git pull"
alias gp="git push"
alias ga="git add"
alias gs="git status"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Load Homebrew config script
source $HOME/.brewconfig.zsh
