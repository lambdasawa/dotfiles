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

function rg-delta
    rg --json --context 10 "$argv" | delta
end

function rg-sk
    sk \
        --tac --no-sort \
        --ansi \
        --interactive \
        --cmd 'rg --color always --line-number "{}"' |
        choose -f : 0
end

function cd
    builtin cd "$argv[1]"
    ll
end

function mkdir-cd
    set d "$argv"
    if [ -z "$argv" ]
        set d (fd --type d | sk)
    end

    mkdir -p $d
    cd "$d"
end

function cd-repo
    z $(ghq list -p | sk)
end

function copy-path
    realpath $argv | tr -d '\n' | clipboard-copy
end

function tmp
    set dir ~/tmp/$(date "+%Y%m%d%H%M%S")
    mkdir -p $dir
    wezterm cli spawn --cwd "$dir"
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

    if [ -e ~/.mise_activate ]
        mise activate fish | source
    else if [ -e ~/.asdf_activate ]
        source /opt/homebrew/opt/asdf/libexec/asdf.fish
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
    fish_add_path $(find $HOME/Library/Android/sdk/build-tools -type d -maxdepth 1 -mindepth 1 2>/dev/null | sort | tail -n1)
    fish_add_path "$HOME/.dotnet/tools"

    if [ -e /opt/homebrew/opt/dotnet/libexec ]
        set -gx DOTNET_ROOT "/opt/homebrew/opt/dotnet/libexec"
    end

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
    alias f 'find-in-files'
    alias g lazygit
    # alias h ''
    alias i "sk --ansi -i -c 'rg --color=always --line-number \"{}\"'"
    alias j jless
    # alias k ''
    alias l ll
    alias m mise
    # alias n ''
    # alias o ''
    alias p copy-path
    alias q pueue
    alias r 'rg-delta'
    # alias s ''
    # alias t ''
    alias u cursor
    # alias v ''
    alias w watchexec
    alias x xargs
    # alias y ''
    # alias z zoxide

    alias ca 'code -a .'
    alias cr 'code -r .'

    alias ua 'cursor -a .'
    alias ur 'cursor -r .'

    alias mr 'mise run'
    alias mw 'mise watch -t'

    alias , 'mkdir-cd'
    alias ,r 'cd-repo'
    alias ,t 'eza --tree --all --git-ignore | bat'
    alias ,c 'clipboard-copy'
    alias ,v 'clipboard-paste'

    alias branch 'git branch --format="%(refname:short)" | sk'
    alias reflog 'git reflog | sk | choose 0'
    alias current-branch 'git rev-parse --abbrev-ref HEAD'
    alias default-branch 'basename $(git symbolic-ref refs/remotes/origin/HEAD)'
    alias git-top 'git rev-parse --show-toplevel'

    alias ymd 'date "+%Y-%m-%d"'
    alias ymdhms 'date "+%Y-%m-%d-%H-%M-%S"'
    alias nowz 'TZ=UTC date "+%Y-%m-%dT%H:%M:%SZ"'
    alias nowj 'TZ=Asia/Tokyo date "+%Y-%m-%dT%H:%M:%S+09:00"'

    alias ip-local 'jc ifconfig | jq -r \'[["name", "addr"]] + map([.name, .ipv4_addr]) | .[] |  @csv\' | qsv table'
    alias ip-global 'curl -sSL https://checkip.amazonaws.com/'

    alias uu uuidgen
    alias random-alnum 'cat /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c 64'
    alias random-ascii 'cat /dev/urandom | LC_ALL=C tr -dc "[:print:]" | head -c 64'

    alias md mdcat
    alias csv 'qsv table'

    alias json-to-yaml 'yq --input-format json --output-format yaml'
    alias yaml-to-json 'yq --input-format yaml --output-format json'
    alias csv-to-json 'jc --csv'
    alias xml-to-json 'jc --xml'
    alias toml-to-json 'jc --toml'
    alias html-to-json 'pup "json{}"'
end
