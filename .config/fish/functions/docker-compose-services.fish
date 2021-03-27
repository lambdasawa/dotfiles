function docker-compose-services -a file
    if [ -z "$file" ]
        set file docker-compose.yml
    end

    cat $file | jc --yaml | jq -r '.[0] | .services | to_entries[] | .key'
end
