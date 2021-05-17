function gh-pr-create
    git push -u origin (git-current-branch) || return 1

    set title_path (mktemp -t PULL_REQUEST_TITLE)
    eval $EDITOR $title_path

    set body_path (mktemp -t PULL_REQUEST_BODY)
    set pr_template_path (git-project-root)/.github/pull_request_template.md
    if [ -e $pr_template_path ]
        cat $pr_template_path >$body_path
    end
    eval $EDITOR $body_path

    gh pr create \
        --title (cat $title_path | head -n 1) \
        --body-file $body_path \
        --assignee @me \
        --draft

    gh pr view -w
end
