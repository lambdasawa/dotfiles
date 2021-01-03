function archive -a dir
    rm -f $dir.zip
    arc archive $dir.zip $dir
    arc ls $dir.zip
end
