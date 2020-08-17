function ffmpeg
    command -v ffmpeg 2>&1 >/dev/null || brew install ffmpeg

    command ffmpeg $argv
end
