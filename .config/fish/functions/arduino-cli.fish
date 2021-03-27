function arduino-cli
    if ! has arduino-cli
        if is-mac
            brew install arduino-cli
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command arduino-cli $argv
end
