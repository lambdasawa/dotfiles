alias a="saws"
alias b="echo __TODO__"
alias c="docker-compose"
alias d="docker"
alias e="code --reuse-window"
alias f="filter"
alias g="git-wrapper"
alias h="find-history"
alias i="echo __TODO__"
alias j="fx"
alias k="fkill -vf"
alias l="list-files"
alias m="echo __TODO__"
alias n="notify"
alias o="echo __TODO__"
alias p="tmuxinator-start-project"
alias q="echo __TODO__"
alias r="reload"
alias s="echo __TODO__"
alias t="tmux-switch-pane"
alias u="echo __TODO__"
alias v="view"
alias w="cd-repo"
alias x="echo __TODO__"
alias y="echo __TODO__"
# alias z="echo __TODO__"

alias rm="gomi"

function reload
    source ~/.config/fish/util.fish
    echo 'Reload success.'
end

function filter
    sk \
        --ansi \
        --prompt 'skim> '
end

function cd
    builtin cd $argv
    list-files
end

function cd-repo
    cd (ghq root)/(ghq list | filter)
end

function list-files
    exa -laB --git $argv
end

function tree-files
    exa -Ta --git
end

function find-file
    sk \
        --ansi \
        --cmd-prompt 'skim> ' \
        -i \
        -c \
        'rg --color=always --line-number "{}"'
end

function view -a file
    set mime (file --mime $file)

    if echo $mime | grep 'application/zip'
        arc ls $file
        return
    end

    if echo $mime | grep 'charset=binary'
        hexyl -n 1028 $file
        return
    end

    bat --theme="Monokai Extended" $file
end

function make-directory -a path
    mkdir -p $path
    cd $path
end

function find-history
    commandline (history | filter)
end

function git-branch
    git branch | grep -v '*' | filter | awk '{print $1}'
end

function git-reflog
    git reflog | filter | awk '{print $1}'
end

function git-remote-ssh-style
    git remote set-url origin git@github.com:(basename (realpath ..))/(basename $PWD).git
end

function git-checkout
    git checkout (git-branch)
end

function git-cherry-pick
    git cherry-pick (git-reflog)
end

function tmux-switch-pane
    set delimiter '|'
    set pane (tmux list-panes -as -F "#{session_id}:#{session_name} $delimiter #{window_id}:#{window_name} $delimiter #{pane_id}:#{pane_current_path}:#{pane_current_command}" | filter)
    set session_id (echo $pane | cut -d'|' -f1 | cut -d':' -f1 | tr -d ' ')
    set window_id (echo $pane | cut -d'|' -f2 | cut -d':' -f1 | tr -d ' ')
    set pane_id (echo $pane | cut -d'|' -f3 | cut -d':' -f1 | tr -d ' ')

    test $TMUX && tmux switch-client -t $session_id || tmux attach-session -t $session_id
    tmux select-window -t $window_id
    tmux select-pane -t $pane_id
end

function tmuxinator-start-project
    tmuxinator start (ls -a ~/.config/tmuxinator/ | grep .yml | sed 's/.yml//g' | filter)
end

function archive -a dir
    rm -f $dir.zip
    arc archive $dir.zip $dir
    arc ls $dir.zip
end

function unarchive -a file
    arc ls $file
    arc unarchive $file
    rm $file
end

function clip-write
    if command -v xsel >/dev/null 2>&1
        xsel --clipboard
        return
    end

    if command -v pbcopy >/dev/null 2>&1
        pbcopy
        return
    end

    echo 'clipboard command not found'
    return 1
end

function clip-path -a path
    if [ -z $path ]
        set path $PWD
    end

    realpath $path | tr -d '\n' | clip-write
end

function clip-file
    cat $argv[1] | clip-write
end

function notify -a msg
    osascript -e "display notification \"$msg\" with title \"notify command\""
end

function repeat
    while true
        echo "################################################################################"
        echo

        eval $argv
        set s $status
        echo

        echo "################################################################################"
        echo

        sleep 1
    end
end

function today
    date '+%Y-%m-%d'
end

function now
    date '+%Y-%m-%d-%H-%M-%S'
end

function random -a n
    if [ -z "$n" ]
        set n 128
    end
    ruby -e "require 'securerandom' ; puts SecureRandom.alphanumeric($n)"
end

function git-wrapper
    set argc (count $argv)

    if [ $argc -eq 0 ]
        tig
    else
        switch $argv[1]
            case issue pr repo gist
                gh $argv[1..-1]
            case '*'
                hub $argv[1..-1]
        end
    end
end

function gh-repos
    hub api "https://api.github.com/users/lambdasawa/repos?per_page=300" | \
        jq -r '.[] | .ssh_url' | \
        sed 's/git@github.com://g'
end

function gh-orgs
    hub api "https://api.github.com/user/orgs" | \
        jq -r '.[] | .login'
end

function gh-org-repos -a org
    hub api "https://api.github.com/orgs/$org/repos?per_page=300" | \
        jq -r '.[] | .ssh_url' | \
        sed 's/git@github.com://g'
end

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

function op-signin
    eval (op signin my lambdasawa@gmail.com)
end

function docker-prune
    docker system prune --all --force --volumes
end

function aws-whoami
    aws iam get-user || aws sts get-caller-identity
end

function gcloud-project-select
    gcloud projects list | f | awk '{print $1}'
end

function kubectl-use-context
    kubectl config use-context (kubectl config get-contexts --output name | f)
end

function enable-fish-postexec-sound
    touch ~/.enable_fish_postexec_sound
end

function disable-fish-postexec-sound
    rm -f ~/.enable_fish_postexec_sound
end

function ubuntu-vm
    cd ~/.dotfiles/vagrant/ubuntu/ && vagrant up && vagrant ssh
end

function kali-vm
    cd ~/.dotfiles/vagrant/kali/ && vagrant up && vagrant ssh
end
