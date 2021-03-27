function redis-cli
    if ! has redis-cli
        if is-mac
            brew install redis
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command redis-cli $argv
end
