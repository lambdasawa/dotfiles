function git-branch-clean
    git branch | grep -v '^* ' | xargs git branch -D && git pull
end
