function youtube-dl
    if ! has youtube-dl
        if is-mac
            brew install youtube-dl
        else if is-debian
            sudo apt install -y youtube-dl
        end
    end

    command youtube-dl $argv
end
