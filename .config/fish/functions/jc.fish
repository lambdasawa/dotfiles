function jc
    if ! has jc
        if is-mac
            brew install jc
        else if is-debian
            sudo apt install -y jc
        end
    end

    command jc $argv
end
