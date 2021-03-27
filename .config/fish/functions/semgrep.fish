function semgrep
    if ! has semgrep
        if is-mac
            brew install semgrep
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command semgrep $argv
end
