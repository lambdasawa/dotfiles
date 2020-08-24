function youtube-dl
    if ! has youtube-dl
        if is-mac
            ffmpeg
            brew install youtube-dl
        else if is-debian
            ffmpeg
            sudo apt install -y youtube-dl
        end
    end

    command youtube-dl $argv
end
