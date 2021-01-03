function gh-repo-create
    gh repo create --private (basename (realpath ..))/(basename $PWD)
    git-remote-ssh-style
    set name (basename $PWD)
    echo "# $name" >README.md
    git add README.md
    gitmoji -c
    git push -u origin master
    gh repo view -w
end
