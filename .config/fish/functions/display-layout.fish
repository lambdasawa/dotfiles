function display-layout
    if ! command -v displayplacer
        brew tap jakehilborn/jakehilborn && brew install displayplacer
    end

    if [ ! -e ~/.displayplacer ]
        echo "#!/bin/bash" >~/.displayplacer
        displayplacer list | tail -n 1 | tee -a ~/.displayplacer
        chmod u+x ~/.displayplacer
    end

    ~/.displayplacer &
end