function asdf
    if [ ! -e ~/.asdf ]
        brew install coreutils curl git
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf
        cd ~/.asdf
        git checkout (git describe --abbrev=0 --tags)
    end

    ~/.asdf/bin/asdf $argv
end
