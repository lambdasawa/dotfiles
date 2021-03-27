function netlify
    if ! has netlify
        if is-mac
            brew install netlify-cli
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command netlify $argv
end
