function git-branch
    git branch | grep -v '*' | filter | awk '{print $1}'
end
