function ec2
    pushd $PWD
    cd ~/.dotfiles
    make start-aws-ec2
    popd
end
