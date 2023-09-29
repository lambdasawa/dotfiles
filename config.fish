function fish_greeting
end

function fish_preexec --on-event fish_preexec
end

function fish_postexec --on-event fish_postexec
end

function ll
    if command -v eza >/dev/null 2>&1
        eza -al $argv
    else
        ls -al $argv
    end
end

function cd
    set d "$argv"
    if [ -z "$argv" ]
        set d (fd --type d | filter)
    end

    builtin cd "$d"

    ll
end

if status is-interactive
    if [ -e /opt/homebrew/bin/brew ]
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end

    if command -v direnv >/dev/null 2>&1
        direnv hook fish | source
    end

    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

    fish_add_path ~/bin

    alias g "gitui"
    alias staging "git add ."
    alias commit "git commit -v"
    alias push "git push"
    alias pull "git pull"
end
