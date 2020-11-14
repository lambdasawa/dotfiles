function gem
    if ! command -v gem 2>&1 >/dev/null
        if is-debian
            # https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
            sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
        end

        asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
        asdf install ruby 2.7.1
    end

    command gem $argv
end
