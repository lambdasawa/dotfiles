function gomi
    if ! has gomi
        if is-mac
            brew install b4b4r07/tap/gomi
        else if is-debian
            echo "TODO"
            exit 1
        end
    end

    command gomi $argv
end
