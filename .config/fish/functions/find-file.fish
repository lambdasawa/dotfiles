function find-file
    sk \
        --ansi \
        --cmd-prompt 'skim> ' \
        -i \
        -c \
        'rg --color=always --line-number "{}"'
end
