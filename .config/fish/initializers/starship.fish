if ! command -v starship 2>&1 >/dev/null
    if command -v brew
        brew install starship
    else if command -v apt
        curl -fsSL https://starship.rs/install.sh | env FORCE=1 bash
    end
end

eval (starship init fish)
