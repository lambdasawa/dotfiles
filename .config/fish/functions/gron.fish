function gron
    if ! has gron
        if is-mac
            brew install gron
        else if is-debian
            go get -u github.com/tomnomnom/gron
        end
    end

    command gron $argv
end
