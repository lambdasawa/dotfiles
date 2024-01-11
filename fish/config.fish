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

function kill-by-port
    set port "$argv[1]"
    kill (lsof -i "tcp:$port" | grep -v PID | awk '{print $2}')
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

    if command -v mise >/dev/null 2>&1
        mise activate fish | source
    end

    fish_add_path /usr/local/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/bin
    fish_add_path ~/dotfiles/bin
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
    alias m mise
    # alias n ''
    # alias o ''
    alias p pnpm
    # alias q ''
    alias r 'mise run'
    # alias s ''
    # alias t ''
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
    alias ce 'docker compose exec'
    alias gl gradle
    alias irg "sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
    alias tree 'eza -T'
end
