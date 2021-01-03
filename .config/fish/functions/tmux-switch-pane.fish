function tmux-switch-pane
    set delimiter '|'
    set pane (tmux list-panes -as -F "#{session_id}:#{session_name} $delimiter #{window_id}:#{window_name} $delimiter #{pane_id}:#{pane_current_path}:#{pane_current_command}" | filter)
    set session_id (echo $pane | cut -d'|' -f1 | cut -d':' -f1 | tr -d ' ')
    set window_id (echo $pane | cut -d'|' -f2 | cut -d':' -f1 | tr -d ' ')
    set pane_id (echo $pane | cut -d'|' -f3 | cut -d':' -f1 | tr -d ' ')

    test $TMUX && tmux switch-client -t $session_id || tmux attach-session -t $session_id
    tmux select-window -t $window_id
    tmux select-pane -t $pane_id
end
