function ffmpeg
    if ! has ffmpeg
        if is-mac
            brew install ffmpeg
        else if is-debian
            sudo apt install -y ffmpeg
        end
    end

    command ffmpeg $argv
end
