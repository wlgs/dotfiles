if status is-interactive
# Commands to run in interactive sessions can go here
end



# macOS Defaults (Commented out as in original)
# if test (defaults read -g InitialKeyRepeat 2>/dev/null) != "10"
#     echo "Setting InitialKeyRepeat to 10..."
#     defaults write -g InitialKeyRepeat -int 10
# end

# if test (defaults read -g KeyRepeat 2>/dev/null) != "1"
#     echo "Setting KeyRepeat to 1..."
#     defaults write -g KeyRepeat -int 1
# end

# if test (defaults read com.apple.dock largesize 2>/dev/null) != "52"
#     echo "Setting largesize to 52..."
#     defaults write com.apple.dock largesize -int 52
# end

# Path setup
fish_add_path /Users/wlgs/.local/bin
fish_add_path /opt/homebrew/bin

set -g fish_greeting
set -g fish_prompt_pwd_dir_length 0
# Editor
set -gx EDITOR nano

# Aliases
alias textedit "open -a TextEdit"
alias gg lazygit
alias wat "system_profiler SPPowerDataType | grep 'Wattage'"
alias power 'sudo powermetrics | grep " Power"'
alias k kubectl

# Tmux
alias t1 "tmux attach -t t1 || tmux new -s t1"
alias t2 "tmux attach -t t2 || tmux new -s t2"
alias t3 "tmux attach -t t3 || tmux new -s t3"
alias t4 "tmux attach -t t4 || tmux new -s t4"

# pnpm
set -gx PNPM_HOME "/Users/wlgs/Library/pnpm"
fish_add_path $PNPM_HOME

# Bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Conda initialize
if test -f "/Users/wlgs/miniconda3/bin/conda"
    eval /Users/wlgs/miniconda3/bin/conda "shell.fish" "hook" | source
end

# fzf integration
if type -q fzf
    fzf --fish | source
end
