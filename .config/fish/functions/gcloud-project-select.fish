function gcloud-project-select
    gcloud projects list | f | awk '{print $1}'
end
