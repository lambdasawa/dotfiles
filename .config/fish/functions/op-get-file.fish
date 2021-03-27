function op-get-file -a path
    if [ -z "$OP_SESSION_my" ]
        op-signin
    end

    set realpath (realpath $path | sed -e "s|$HOME|~|")
    echo $realpath

    set title "op:$realpath"
    echo $title

    set item_id (op list items | jq -r ".[] | select(.overview.title == \"$title\") | .uuid")
    echo $item_id

    op get item $item_id | jq -r ".details.notesPlain" | base64 -d | tee (echo $realpath | sed "s|~|$HOME|")
end
