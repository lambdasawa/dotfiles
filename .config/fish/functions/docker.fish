function docker
    command -v docker 2>&1 >/dev/null || brew install docker

    command docker $argv
end
