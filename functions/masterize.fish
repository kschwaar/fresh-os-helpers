function masterize
    for file in ~/workspace/*
        if test -d "$file"
            cd $file
            git checkout master
            git pull
            cd ~
        end
    end
end
