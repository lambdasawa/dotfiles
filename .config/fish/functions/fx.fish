function fx
    if ! has fx
        if is-mac
            brew install fx
        else if is-debian
            curl -sSL https://fx.wtf | bash
            mv fx ~/bin
            rm fx*
        end
    end

    command fx $argv
end
