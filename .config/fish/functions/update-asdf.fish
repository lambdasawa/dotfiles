function update-asdf
    asdf plugin update --all

    set go_version (asdf list all golang | grep -v beta | tail -n 1)
    asdf install golang $go_version
    asdf global golang $go_version

    set rust_version (asdf list all rust | tail -n 1)
    asdf install rust $rust_version
    asdf global rust $rust_version

    set haskell_version (asdf list all haskell | grep -v latest | grep -v alpha | grep -v beta | grep -v rc | tail -n 1)
    asdf install haskell $haskell_version
    asdf global haskell $haskell_version

    set java_version (asdf list all java | grep zulu | grep -v javafx | tail -n 1)
    asdf install java $java_version
    asdf global java $java_version

    set nodejs_version (asdf list all nodejs | tail -n 1)
    asdf install nodejs $nodejs_version
    asdf global nodejs $nodejs_version

    set ruby_version (asdf list all ruby | grep -v truffle | grep -v ree | grep -v rbx | grep -v mruby | grep -v jruby | grep -v maglev | grep -v dev | grep -v rc | grep -v preview | grep -e '^2.' | tail -n 1)
    asdf install ruby $ruby_version
    asdf global ruby $ruby_version

    set python_version (asdf list all python | grep -v stackless | grep -v pyston | grep -v pypy | grep -v mambaforge | grep -v miniforge | grep -v miniconda | grep -v micropython | grep -v jython | grep -v ironpython | grep -v graalpython | grep -v anaconda | grep -v activepython | grep -v dev | grep -v 3.10 | grep -v 3.9 | tail -n 1)
    asdf install python $python_version
    asdf global python $python_version

    # https://github.com/asdf-community/asdf-php/issues/88
    # brew install gmp libsodium imagemagick bison re2c gd libiconv libpq
    # set php_version (asdf list all php | grep -v RC | tail -n 1)
    # asdf install php $php_version
    # asdf global php $php_version
end
