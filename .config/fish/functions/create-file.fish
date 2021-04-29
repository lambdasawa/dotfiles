function create-file -a path
    set dir (dirname $path)
    mkdir -p $dir
    touch $path
end
