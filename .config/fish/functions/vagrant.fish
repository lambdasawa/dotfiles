function vagrant
    command -v vagrant 2>&1 >/dev/null || brew cask install vagrant

    command vagrant $argv
end
