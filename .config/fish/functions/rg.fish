function rg
    if ! has rg
        if is-mac
            brew install ripgrep
        else if is-debian
            sudo apt install -y ripgrep
        end
    end

    command rg $argv
end
