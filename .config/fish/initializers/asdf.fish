if [ ! -e ~/.asdf ]
    if command -v brew
        brew install coreutils curl git
    else if command -v apt
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
