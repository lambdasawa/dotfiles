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
