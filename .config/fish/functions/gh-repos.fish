function gh-repos
    hub api "https://api.github.com/users/lambdasawa/repos?per_page=300" | \
        jq -r '.[] | .ssh_url' | \
        sed 's/git@github.com://g'
end
