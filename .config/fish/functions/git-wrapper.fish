function git-wrapper
    set argc (count $argv)

    if [ $argc -eq 0 ]
        tig
    else
        switch $argv[1]
            case gist issue pr release repo alias api auth secret ssh-key
                gh $argv[1..-1]
            case '*'
                hub $argv[1..-1]
        end
    end
end
