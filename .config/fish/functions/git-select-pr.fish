function git-select-pr
    gh pr list -a @me | filter | awk '{print $1}'
end
