function gcloud
    if ! has gcloud
        asdf plugin add gcloud
        asdf install gcloud latest
        asdf global gcloud 316.0.0
        asdf reshim
    end

    command gcloud $argv
end
