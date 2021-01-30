function note
    set dir "$HOME/var/note/"
    set time (date '+%Y-%m-%d-%H-%M-%S')
    set cmd (echo $argv | sed 's/[ \\/\\.]/_/g')
    set path "$dir/$time-$cmd.log"

    mkdir -p $dir

    echo "\$ $argv" >$path

    eval $argv 2>&1 | tee -a $path
end
