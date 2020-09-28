function go
    if [ ! -e ~/.asdf/shims/go ]
        asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
        asdf install golang 1.15
    end

    command go $argv
end
