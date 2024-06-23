function fish_greeting
end

function fish_preexec --on-event fish_preexec
    set -g _fish_preexec_time (date +%s)
end

function fish_postexec --on-event fish_postexec
    set last_status $status
    set _fish_postexec_time (date +%s)
    set elapsed_time (math $_fish_postexec_time - $_fish_preexec_time)
    if [ $elapsed_time -gt 3 ]
        set message ''
        if [ $last_status -eq 0 ]
            set message OK
        else
            set message Error
        end

        if [ -e ~/.fish_postexec_say ]
            if command -v say >/dev/null 2>&1
                say "$message"
            end
        end

        if [ -e ~/.fish_postexec_desktop_notification ]
            if command -v osascript >/dev/null 2>&1
                osascript -e (printf 'display notification "%s" with title "fish"' "$message")
            end
        end
    end
end

function ll
    if command -v eza >/dev/null 2>&1
        eza -al $argv
    else
        ls -al $argv
    end
end

function cd
    builtin cd "$argv[1]"
    ll
end

function mkdir-cd-ll
    set d "$argv"
    if [ -z "$argv" ]
        set d (fd --type d | sk)
    end

    mkdir -p $d
    cd "$d"
    ll
end

function cd-repo
    z $(ghq list -p | sk)
end

function tmp
    set dir $HOME/tmp/(now)
    mkdir -p $dir
    cd $dir
end

function scratch
    set dir $HOME/src/github.com/lambdasawa/sandbox/scratch-$(now)
    mkdir -p $dir
    cd $dir
end

function kill-by-port
    set port "$argv[1]"
    kill (lsof -i "tcp:$port" | grep -v PID | awk '{print $2}')
end

function clipboard-copy
    if command -v pbcopy >/dev/null 2>&1
        cat | pbcopy
        pbpaste
    end
end

function clipboard-paste
    if command -v pbpaste >/dev/null 2>&1
        pbpaste
    end
end

function mise-upgrade
    mise upgrade
    for l in (cat ~/.config/mise/config.toml | jc --toml | jq -r '.tools | to_entries[] | .key')
        mise install "$l@latest"
        mise global --pin "$l@latest"
    end
end

function kill-ds-store
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    killall Finder
    echo "find ~ -name .DS_Store -delete"
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
    fish_add_path "$HOME/.local/bin"
    fish_add_path "$HOME/bin"
    fish_add_path "$HOME/dotfiles/bin"
    fish_add_path "$HOME/.rd/bin"
    fish_add_path "$HOME/.pub-cache/bin"
    fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
    fish_add_path "$HOME/Library/Android/sdk/platform-tools"
    fish_add_path "$HOME/Library/Android/sdk/tools/bin"

    if which code >/dev/null 2>&1
        set -gx EDITOR "code --wait"
    else if which vim >/dev/null 2>&1
        set -gx EDITOR vim
    end

    # alias a ''
    alias b bat
    alias c 'docker compose'
    alias d docker
    alias e code
    alias f broot
    alias g lazygit
    alias h hexyl
    alias i "sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
    alias j jless
    # alias k ''
    alias l ll
    alias m mise
    # alias n ''
    alias o ouch
    alias p realpath
    # alias q ''
    # alias r ''
    # alias s ''
    # alias t ''
    # alias u ''
    # alias v ''
    alias w watchexec
    alias x xargs
    alias y yarn
    # alias z zoxide

    alias tree 'eza --tree --all --git-ignore'

    alias today 'date "+%Y-%m-%d"'
    alias now 'date "+%Y-%m-%d-%H-%M-%S"'

    alias ca 'code -a .'
    alias cr 'code -r .'

    alias ce 'docker compose exec'

    alias mr 'mise run --'
    alias mw 'mise watch -t'
    alias mise-init 'cp ~/dotfiles/mise/config.toml .mise.toml && code .mise.toml'

    alias nr 'npm run'

    alias , mkdir-cd-ll
    alias ,r cd-repo
    alias ,c clipboard-copy
    alias ,v clipboard-paste

    alias ,gl 'git log -p'
    alias ,gs 'git switch'
    alias ,gsc 'git switch -C'
    alias ,ga 'git add .'
    alias ,gap 'git add -p'
    alias ,gs "git stash"
    alias ,gc 'git commit -v'
    alias ,gP 'git push'
    alias ,gp 'git pull'
    alias ,gbranch 'git branch --format="%(refname:short)" | sk'
    alias ,greflog 'git reflog | sk | awk "{print \$1}"'
    alias ,groot 'git rev-parse --show-toplevel'
    alias ,gtop 'git rev-parse --show-toplevel'
    alias ,gcurrent-branch 'git rev-parse --abbrev-ref HEAD'
    alias ,gdefault-branch 'basename $(git symbolic-ref refs/remotes/origin/HEAD)'
    alias ,grebase 'git fetch origin $(basename $(git symbolic-ref refs/remotes/origin/HEAD)) && git rebase origin'
    alias ,gignore 'curl -sSL https://raw.githubusercontent.com/github/gitignore/main/$(curl -sSL "https://api.github.com/repos/github/gitignore/git/trees/main" | jq -r ".tree[] .path" | grep .gitignore | sk)'

    alias ,ifconfig 'ifconfig | jc --ifconfig'
    alias ip-local 'ifconfig | jc --ifconfig | jq -r \'.[] | .ipv4_addr\''
    alias ip-global 'curl -sSL https://checkip.amazonaws.com/'

    alias uu uuidgen
    alias random-alnum 'cat /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c 32'
    alias random-ascii 'cat /dev/urandom | LC_ALL=C tr -dc "[:print:]" | head -c 32'

    alias md mdcat
    alias csv csview
end
