if ! command -v direnv 2>&1 >/dev/null
    if is-mac
        brew install direnv
    else if is-debian
        sudo apt install -y direnv
    end
end

eval (direnv hook fish)
