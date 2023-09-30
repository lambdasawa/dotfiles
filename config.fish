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

function md
    set d "$argv"
    mkdir -p $d
    cd $d
end

function zlj
    set path "$argv[1]"
    if [ -z "$path" ]
        set session $(zellij list-sessions | sk)
        if [ -z "$session" ]
            return # noop
        end

        zellij a "$session"
        return # attach selected session
    end

    zellij a -c (basename (realpath "$path")) # attach or create session
end

if status is-interactive
    if [ -e /opt/homebrew/bin/brew ]
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    if command -v starship >/dev/null 2>&1
        starship init fish | source
    end

    if command -v zoxide >/dev/null 2>&1
        zoxide init fish | source
    end

    if command -v direnv >/dev/null 2>&1
        direnv hook fish | source
    end

    if command -v rtx >/dev/null 2>&1
        rtx activate fish | source
    end

    fish_add_path ~/bin

    if which code >/dev/null 2>&1
        set -gx EDITOR "code --wait"
    else if which vim >/dev/null 2>&1
        set -gx EDITOR vim
    end

    # alias a ''
    # alias b ''
    alias c 'docker compose'
    alias d docker
    alias e code
    # alias f ''
    alias g gitui
    # alias h ''
    # alias i ''
    alias j jless
    # alias k ''
    alias l ll
    # alias m ''
    # alias n ''
    # alias o ''
    # alias p ''
    # alias q ''
    # alias r ''
    # alias s ''
    alias t task
    # alias u ''
    # alias v ''
    alias w watchexec
    alias x xargs
    # alias y ''
    # alias z zoxide
    alias staging "git add ."
    alias commit "git commit -v"
    alias push "git push"
    alias pull "git pull"
end
