function git-wrapper
    set argc (count $argv)

    if [ $argc -eq 0 ]
        tig
    else
        for gh_subcommand in (gh | grep -e '  \w*:' | awk '{print $1}' | sed s/:// | sort)
            if [ $argv[1] = "$gh_subcommand" ]
                gh $argv[1..-1]
                return $status
            end
        end
        hub $argv[1..-1]
    end
end
