function fish_right_prompt
    # Execution Time
    if test -n "$CMD_DURATION"; and test "$CMD_DURATION" -gt 0
        set -l duration "$CMD_DURATION"
        if test $duration -ge 1000
            set -l secs (math --scale=1 "$duration / 1000")
            echo -n "$secss"
        else
            echo -n "$durationms"
        end
    end
function fish_right_prompt
    # Execution Time
    if test -n "$CMD_DURATION"; and test "$CMD_DURATION" -gt 0
        set -l duration "$CMD_DURATION"
        if test $duration -ge 1000
            set -l secs (math --scale=1 "$duration / 1000")
            echo -n "$secs""s "
        else
            echo -n "$duration""ms "
        end
    end

    # Python
    if test -n "$VIRTUAL_ENV"; or count *.py >/dev/null 2>/dev/null
        if type -q python
            set -l py_ver (python -V 2>&1 | string replace -r 'Python ' '')
            set -l venv ""
            if test -n "$VIRTUAL_ENV"
                set venv (basename "$VIRTUAL_ENV")"-"
            end
            set_color 906cff
            echo -n "py@$venv$py_ver "
        end
    end

    # Go
    if test -f go.mod; or count *.go >/dev/null 2>/dev/null
        if type -q go
            set -l go_ver (go env GOVERSION | string replace "go" "")
            set_color 7FD5EA
            echo -n "go@$go_ver "
        end
    end

    # Node
    if test -f package.json; or count *.js >/dev/null 2>/dev/null
        if type -q node
            set -l node_ver (node -v 2>/dev/null | string replace "v" "")
            set_color 76b367
            echo -n "js@$node_ver "
        end
    end

    # Ruby
    if test -f Gemfile; or count *.rb >/dev/null 2>/dev/null
        if type -q ruby
            set -l ruby_ver (ruby -e 'print RUBY_VERSION' 2>/dev/null)
            set_color f44336
            echo -n "ruby@$ruby_ver "
        end
    end

    # Julia
    if count *.jl >/dev/null 2>/dev/null
        if type -q julia
            # Julia takes longer to start, keeping string manipulation minimal
            set -l julia_ver (julia -v 2>/dev/null | string split " " | reverse | head -n 1)
            set_color 4063D8
            echo -n "julia@ $julia_ver "
        end
    end

    set_color normal
end
    # Python
    if test -n "$VIRTUAL_ENV"; or count *.py >/dev/null 2>/dev/null
        if type -q python
            set -l py_ver (python -V 2>&1 | string replace -r 'Python ' '')
            set -l venv ""
            if test -n "$VIRTUAL_ENV"
                set venv (basename "$VIRTUAL_ENV")"-"
            end
            set_color 906cff
            echo -n "py@$venv$py_ver "
        end
    end

    # Node
    if test -f package.json; or count *.js >/dev/null 2>/dev/null
        if type -q node
            set -l node_ver (node -v 2>/dev/null | string replace "v" "")
            set_color 76b367
            echo -n "js@$node_ver "
        end
    end

    set_color normal
end
