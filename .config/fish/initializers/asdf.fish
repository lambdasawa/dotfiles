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
