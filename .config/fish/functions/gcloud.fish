function gcloud
    if ! has gcloud
        asdf plugin add gcloud
        asdf install gcloud latest
        asdf global gcloud (cat ~/.tool-versions | grep gcloud | awk '{print $2}')
        asdf reshim
    end

    command gcloud $argv
end
