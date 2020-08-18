set -gx EDITOR "code --wait"

set -gx PATH $PATH $HOME/bin

function setup-starship
    if ! command -v starship 2>&1 >/dev/null
        brew install starship
    end

    eval (starship init fish)
end

function setup-direnv
    if ! command -v direnv 2>&1 >/dev/null
        brew install direnv
    end

    eval (direnv hook fish)
end

function setup-zoxide
    if ! command -v zoxide 2>&1 >/dev/null
        brew install zoxide
    end

    zoxide init fish | source
end

function setup-asdf
    if [ ! -e ~/.asdf ]
        brew install coreutils curl git
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf
        cd ~/.asdf
        git checkout (git describe --abbrev=0 --tags)
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
