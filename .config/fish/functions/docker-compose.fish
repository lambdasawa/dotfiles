function docker-compose
    command -v docker-compose 2>&1 >/dev/null || brew install docker-compose

    command docker-compose $argv
end
