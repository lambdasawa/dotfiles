function git-reflog
    git reflog | filter | awk '{print $1}'
end
