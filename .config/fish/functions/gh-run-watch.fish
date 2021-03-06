function gh-run-watch
    pushd $PWD
    cd (git-project-root)

    while true
        echo "["(date)"] Wait action..."
        set id (
          gh api /repos/(basename (realpath $PWD/..))/(basename $PWD)/actions/runs |
          jq -r '.workflow_runs[] | select(.status == "in_progress") | .id' | head -n 1
        )
        if [ -n "$id" ]
            gh run watch $id --exit-status
            if [ $status -eq 0 ]
                notify "GitHub Action succeeded!"
            else
                notify "GitHub Action failed..."
            end
            gh run view $id --log
        end
        sleep 5
    end

    popd
end
