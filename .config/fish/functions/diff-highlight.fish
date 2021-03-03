function diff-highlight
    if ! has diff-highlight
        if is-mac
            echo TODO
        else if is-debian
            cp (find /usr/share/doc/git/ -name diff-highlight -type f) ~/bin/diff-highlight
            chmod u+x ~/bin/diff-highlight
        end
    end

    command diff-highlight $argv
end
