function jq
    if ! has jq
        if is-mac
            brew install jq
        else if is-debian
            sudo apt install -y jq
        end
    end

    command jq $argv
end
