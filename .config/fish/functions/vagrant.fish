function vagrant
    command -v vagrant 2>&1 >/dev/null || brew install --cask vagrant

    command vagrant $argv
end
