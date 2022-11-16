function unused-objects
    set sobjects (sfdx force:schema:sobject:list -c custom -u $argv | tr '\n' ',' | sed 's/.$//')
    sfdx force:limits:recordcounts:display -u $argv -s $sobjects | grep -E '\s0$'
end
