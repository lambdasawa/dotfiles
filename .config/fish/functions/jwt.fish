function jwt
    if ! has jwt
        if is-mac
            brew tap mike-engel/jwt-cli
            brew install jwt-cli
        else if is-debian
            return 1
        end
    end

    command jwt $argv
end
