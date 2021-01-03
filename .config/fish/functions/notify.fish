function notify -a msg
    osascript -e "display notification \"$msg\" with title \"notify command\""
end
