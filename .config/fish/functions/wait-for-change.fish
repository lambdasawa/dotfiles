function wait-for-change -a cmd
    echo "\$ $cmd"
    set first_result (eval $cmd)
    echo $first_result

    while true
        sleep 10

        echo "\$ $cmd"
        set result (eval $cmd)
        echo $result

        if [ "$result" != "$first_result" ]
            echo "Changed!"
            break
        end
    end
end
