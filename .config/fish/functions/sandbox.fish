function sandbox
    set owner lambdasawa-sandbox
    mkdir -p ~/src/github.com/$owner

    set owner_repo (gh repo list $owner | awk '{print $1}' | sk)

    if [ -z "$owner_repo" ]
        read -P "repo name> " repo

        set owner_repo "$owner/$repo"

        gh repo create $owner_repo --confirm --template lambdasawa-sandbox/template --private
        ghq get git@github.com:$owner_repo.git

        pushd $PWD
        cd ~/src/github.com/$owner_repo

        for path in (ls -A | grep -v '.git$')
            sed -i '' -e "s/__REPO__/$repo/g" $path
        end
        git add .
        git commit -m "Initialize sandbox"
        git push -u origin main

        popd
    end

    if [ ! -e "~/src/github.com/$owner_repo" ]
        ghq get git@github.com:$owner_repo.git
    end

    cd ~/src/github.com/$owner_repo

    gh repo view -w
    tmuxinator local
    code --reuse-window .
end
