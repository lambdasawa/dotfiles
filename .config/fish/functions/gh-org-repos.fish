function gh-org-repos -a org
    hub api "https://api.github.com/orgs/$org/repos?per_page=300" | \
        jq -r '.[] | .ssh_url' | \
        sed 's/git@github.com://g'
end
