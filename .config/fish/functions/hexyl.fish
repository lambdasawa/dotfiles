function hexyl
    if ! has hexyl
        if is-mac
            brew install hexyl
        else if is-debian
            sudo apt install -y hexyl
        end
    end

    command hexyl $argv
end
