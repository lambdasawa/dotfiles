function git-remote-ssh-style
    git remote set-url origin git@github.com:(basename (realpath ..))/(basename $PWD).git
end
