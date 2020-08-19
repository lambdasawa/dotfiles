function docker-compose
    if ! has docker-compose
        if is-mac
            brew install docker-compose
        else if is-debian
            sudo apt install -y docker-compose
        end
    end

    command docker-compose $argv
end
