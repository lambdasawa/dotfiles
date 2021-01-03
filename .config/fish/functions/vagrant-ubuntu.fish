function vagrant-ubuntu
    pushd $PWD
    cd ~/.dotfiles
    make start-vagrant-ubuntu
    popd
end
