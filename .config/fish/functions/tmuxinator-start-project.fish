function tmuxinator-start-project
    tmuxinator start (ls -a ~/.config/tmuxinator/ | grep .yml | sed 's/.yml//g' | filter)
end
