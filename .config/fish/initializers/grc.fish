if ! command -v grc 2>&1 >/dev/null
    if command -v brew
        brew install grc
    else if command -v apt
        sudo apt install -y grc
    end
end
