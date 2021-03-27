function copilot
    if ! has copilot
        if is-mac
            brew install copilot-cli
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command copilot $argv
end
