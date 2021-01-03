function clip-write
    if command -v xsel >/dev/null 2>&1
        xsel --clipboard
        return
    end

    if command -v pbcopy >/dev/null 2>&1
        pbcopy
        return
    end

    echo 'clipboard command not found'
    return 1
end
