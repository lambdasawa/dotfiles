function vagrant-kali
    pushd $PWD
    cd ~/.dotfiles
    make start-vagrant-kali
    popd
end
