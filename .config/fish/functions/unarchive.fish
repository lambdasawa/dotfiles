function unarchive -a file
    arc ls $file
    arc unarchive $file
    rm $file
end
