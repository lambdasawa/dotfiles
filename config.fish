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

function cc
    if command -v pbcopy >/dev/null 2>&1
        cat | pbcopy
    end
end

function cv
    if command -v pbpaste >/dev/null 2>&1
        pbpaste
    end
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

    pushd $PWD
    cd $path
    zellij a -c (basename (realpath "$path")) # attach or create session
    popd
end

function sandbox
    set name $(now)
    set dir ~/tmp/sandbox/$name
    mkdir -p $dir
    code -a $dir
    code $dir/Taskfile
    zellij action new-tab -l compact -c $dir -n $name
end

function python-init
    rtx local --pin python@latest
    curl -sSL https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore -o .gitignore
    python -m venv venv
    pip freeze >requirements.txt
    pip install -r requirements.txt
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
    fish_add_path ~/Library/Android/sdk/platform-tools/
    fish_add_path ~/Library/Android/sdk/tools/bin/
    fish_add_path "/Applications/IntelliJ IDEA.app/Contents/MacOS/"

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
    alias g git
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
    alias y yarn
    # alias z zoxide
    alias today 'date "+%Y-%m-%d"'
    alias now 'date "+%Y-%m-%d-%H-%M-%S"'
    alias gx gitui
    alias toplevel 'git rev-parse --show-toplevel'
    alias branch 'git branch --format="%(refname:short)" | sk'
    alias current-branch 'git rev-parse --abbrev-ref HEAD'
    alias default-branch 'basename $(git symbolic-ref refs/remotes/origin/HEAD)'
    alias reflog 'git reflog | sk | awk "{print \$1}"'
    alias repo 'ghq list -p | sk'
    alias pr 'gh pr list | sk | awk "{print \$1}"'
    alias chbranch "git switch"
    alias mkbranch "git switch -C"
    alias add "git add -p"
    alias commit "git commit -v"
    alias amend "git commit -v --amend"
    alias push "git push"
    alias pull "git pull"
    alias review='gh pr list -S "review-requested:@me" | awk "{print \$1}" | xargs -n 1 gh pr view -w'
    alias zj zellij
    alias ce 'docker compose exec'
    alias fish_venv ". ./venv/bin/activate.fish"
end
