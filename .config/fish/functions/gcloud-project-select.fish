function gcloud-project-select
    set p (gcloud projects list | f | awk '{print $1}')

    [ -z "$p" ] && exit

    gcloud config set project $p
end
