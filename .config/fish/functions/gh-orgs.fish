function gh-orgs
    hub api "https://api.github.com/user/orgs" | jq -r '.[] | .login'
end
