# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(fzf --zsh)"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git

autoload -U compinit && compinit
zinit cdreplay -q

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/wlgs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/wlgs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/wlgs/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/wlgs/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Created by `pipx` on 2024-10-15 11:10:40
export PATH="$PATH:/Users/wlgs/.local/bin"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/wlgs.toml)"
fi


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

alias textedit='open -a TextEdit'
alias gg='lazygit'
alias wat="system_profiler SPPowerDataType | grep 'Wattage'"
alias power='sudo powermetrics | grep " Power"'
alias cointop='TERM=screen-256color cointop'


# tmux
alias t1='tmux attach -t t1 || tmux new -s t1'
alias t2='tmux attach -t t2 || tmux new -s t2'
alias t3='tmux attach -t t3 || tmux new -s t3'
alias t4='tmux attach -t t4 || tmux new -s t4'

GPG_TTY=$TTY
export GPG_TTY
if [ -z "$TMUX" ]
then
    tmux attach -t t1 || tmux new -s t1
fi
export GPG_TTY=$(tty)
