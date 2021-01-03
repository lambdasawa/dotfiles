if ! command -v direnv 2>&1 >/dev/null
    if command -v brew
        brew install direnv
    else if command -v apt
        sudo apt install -y direnv
    end
end

eval (direnv hook fish)
