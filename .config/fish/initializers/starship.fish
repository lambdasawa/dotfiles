if ! command -v starship 2>&1 >/dev/null
    if is-mac
        brew install starship
    else if is-debian
        curl -fsSL https://starship.rs/install.sh | env FORCE=1 bash
    end
end

eval (starship init fish)
