# Ensure InitialKeyRepeat is set to 10
#if [[ "$(defaults read -g InitialKeyRepeat 2>/dev/null)" != "10" ]]; then
#  echo "Setting InitialKeyRepeat to 10..."
#  defaults write -g InitialKeyRepeat -int 10
#fi

# Ensure KeyRepeat is set to 1
#if [[ "$(defaults read -g KeyRepeat 2>/dev/null)" != "1" ]]; then
#  echo "Setting KeyRepeat to 1..."
#  defaults write -g KeyRepeat -int 1
#fi

# Ensure KeyRepeat is set to 1
#if [[ "$(defaults read com.apple.dock largesize 2>/dev/null)" != "52" ]]; then
#  echo "Setting KeyRepeat to 1..."
#  
#  defaults write com.apple.dock largesize -int 52
#fi



# ssh-add --apple-use-keychain ~/.ssh/id_ed25519

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi





export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/Users/wlgs/.local/bin"
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


autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi








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

# oh-my-posh for prompt rendering
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/wlgs.toml)"

# history vars
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# aliases
alias textedit='open -a TextEdit'
alias gg='lazygit'
alias wat="system_profiler SPPowerDataType | grep 'Wattage'"
alias power='sudo powermetrics | grep " Power"'
alias cointop='TERM=screen-256color cointop'
alias k='kubectl'

# source <(kubectl completion zsh)
# source <(helm completion zsh)
# complete -C '/usr/local/bin/aws_completer' aws

# tmux & auto-attach
alias t1='tmux attach -t t1 || tmux new -s t1'
alias t2='tmux attach -t t2 || tmux new -s t2'
alias t3='tmux attach -t t3 || tmux new -s t3'
alias t4='tmux attach -t t4 || tmux new -s t4'

# pnpm
export PNPM_HOME="/Users/wlgs/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end




if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/wlgs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wlgs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/wlgs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wlgs/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
source <(ng completion script)
