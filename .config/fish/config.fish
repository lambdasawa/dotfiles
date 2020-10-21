set -gx EDITOR "code --wait"

if [ -e /Applications/Firefox.app/Contents/MacOS/firefox ]
    set -gx BROWSER /Applications/Firefox.app/Contents/MacOS/firefox
end

set -gx PATH $PATH $HOME/bin

function setup-starship
    if ! command -v starship 2>&1 >/dev/null
        if is-mac
            brew install starship
        else if is-debian
            curl -fsSL https://starship.rs/install.sh | env FORCE=1 bash
        end
    end

    eval (starship init fish)
end

function setup-direnv
    if ! command -v direnv 2>&1 >/dev/null
        if is-mac
            brew install direnv
        else if is-debian
            sudo apt install -y direnv
        end
    end

    eval (direnv hook fish)
end

function setup-zoxide
    if ! command -v zoxide 2>&1 >/dev/null
        if is-mac
            brew install zoxide
        else if is-debian
            curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh
        end
    end

    zoxide init fish | source
end

function setup-asdf
    if [ ! -e ~/.asdf ]
        if is-mac
            brew install coreutils curl git
        else if is-debian
            sudo apt install -y curl git
        end
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf
        pushd $PWD
        cd ~/.asdf
        git checkout (git describe --abbrev=0 --tags)
        popd
    end

    source $HOME/.asdf/asdf.fish
    source $HOME/.asdf/completions/asdf.fish
end

function setup-util
    source ~/.config/fish/util.fish
end

function setup-all
    setup-starship
    setup-direnv
    setup-zoxide
    setup-asdf
    setup-util
end

setup-all

function play_command_status_sound --on-event fish_postexec
    set s $status
    if [ ! -e ~/.enable_fish_postexec_sound ]
        return
    end

    set audio ""
    if [ $s -eq 0 ]
        set audio ~/.dotfiles/dat/success.mp3
    else
        set audio ~/.dotfiles/dat/failure.mp3
    end
    if [ ! -e $audio ]
        return
    end

    if command -v afplay 2>&1 >/dev/null
        afplay $audio &
    end
end
