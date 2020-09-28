function http
    if ! has http
        if is-mac
            brew install httpie
        else if is-debian
            sudo apt install -y httpie
        end
    end

    command http $argv
end
