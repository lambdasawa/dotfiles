function extract-github-actions-secret-names -a workflow_path
    cat $workflow_path | yq eval -j | gron | grep 'secrets\.' | sed -e 's/.*secrets.\([a-zA-Z_\-]*\).*/\1/'
end
