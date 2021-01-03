function kubectl-context-select
    kubectl config use-context (kubectl config get-contexts --output name | f)
end
