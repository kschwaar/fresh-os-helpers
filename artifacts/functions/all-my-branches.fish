function all-my-branches
    for file in ~/workspace/*
        if test -d "$file"
            cd $file
	    if test -d .git
	    	echo $file (git branch --show-current)
	    end
            cd ~
        end
    end
end
