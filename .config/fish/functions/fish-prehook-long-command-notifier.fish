function fish-prehook-long-command-notifier --on-event fish_preexec
    mkdir -p ~/tmp/fish/process/start_at/
    date +%s >~/tmp/fish/process/start_at/$fish_pid
end
