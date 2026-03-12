function fish_prompt
    # Path (Yellow, Bold)
    set_color -o F1FA8C
    # prompt_pwd is the standard fish function for shortening paths
    echo -n (prompt_pwd)

    # Git Branch
    set -l branch (git branch --show-current 2>/dev/null)
    if test -n "$branch"
        set_color normal
        set_color ffffff
        echo -n " on "
        set_color -o 43CCEA
        echo -n "$branch"
    end

    # Newline and Prompt Character
    echo ""
    set_color FFFFFF
    echo -n '$ '
    set_color normal
end
