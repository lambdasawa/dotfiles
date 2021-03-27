function op-put-file -a path
    if [ -z "$OP_SESSION_my" ]
        op-signin
    end

    set realpath (realpath $path | sed -e "s|$HOME|~|")
    echo $realpath

    set title "op:$realpath"
    echo $title

    set item_id (op list items | jq -r ".[] | select(.overview.title == \"$title\") | .uuid")
    echo $item_id

    if [ -z "$item_id" ]
        set item_id (op create item 'Secure Note' '{}' --title $title | jq -r ".uuid")
        echo "Item created."
    end

    cat $path


    op edit item $item_id notesPlain=(cat $path | base64)
    echo "Item edited."
end
