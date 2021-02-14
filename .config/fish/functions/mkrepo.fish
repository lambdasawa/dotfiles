function mkrepo -a name
    pushd $PWD

    if [ -z "$name" ]
        set name (random-string 16)
    end
    mcd ~/src/github.com/lamb-sbx/$name
    touch README.md
    git init
    git add README.md
    git commit -m 'First commit'
    gh repo create lamb-sbx/$name --confirm --private
    git-remote-ssh-style
    e .

    popd
end
