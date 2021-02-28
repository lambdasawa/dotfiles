function tmux-open-workspace -a path
    set dir (dirname $path)
    set name (basename $path | head -c18 | sed 's/\./-/g')

    if ! tmux has-session -t $name 2>/dev/null
        tmux new-session -d -c $path -s $name
    end

    test $TMUX && tmux switch-client -t $name || tmux attach-session -t $name
end
