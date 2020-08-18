function gem
    if ! command -v gem 2>&1 >/dev/null
        asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
        asdf install ruby 2.7.1
    end

    command gem $argv
end
