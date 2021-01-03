function clip-path -a path
    if [ -z $path ]
        set path $PWD
    end

    realpath $path | tr -d '\n' | clip-write
end
