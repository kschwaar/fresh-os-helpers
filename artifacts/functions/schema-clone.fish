function bulk-rename

    rename Adder Cost *
    if [ -d fields ]
        cd ./fields
        rename Adder Cost *
    end

    if [ -d ../listViews ]
        cd ../listViews
        rename Adder Cost *
    end

    if [ -d ../validationRules ]
        cd ../validationRules
        rename Adder Cost *
    end

    if [ -d ../webLinks ]
        cd ../webLinks
        rename Adder Cost *
    end
end

function schema-clone
    set prt (pwd)
    if [ -d tmp ]
        rm -rf tmp
    end

    mkdir tmp
    cp -r Adder__c tmp/
    cp -r Adder_Setup__c tmp/

    cd tmp


    # RENAME FILES
    rename Adder Cost *
    cd $prt/tmp/Cost__c
    bulk-rename
    cd $prt/tmp/Cost_Setup__c
    bulk-rename

    cd $prt/tmp
    # Text Replace
    grep -rl Adder . | xargs sed -i s/Adder/Cost/g
    grep -rl '<enableEnhancedLookup>true<\/enableEnhancedLookup>' . | xargs sed -i 's/<enableEnhancedLookup>true<\/enableEnhancedLookup>/<enableEnhancedLookup>false<\/enableEnhancedLookup>/g'
    grep -rlPz '<formula>.*Dealer_Cost.*\n+.*\/formulaTreatBlanksAs>' . | xargs rm
    grep -rl '<referenceTo>Dealer_Cost__c<\/referenceTo>' . | xargs rm
    grep -rl '<errorDisplayField>Dealer_Cost__c<\/errorDisplayField>' . | xargs rm
    grep -rl '<columns>Cost__c</columns>' . | xargs rm
    grep -rl Cost_Rate__c . | xargs rm
    grep -rl Dealer_Cost__r . | xargs rm
    grep -rlPz '<formula>if\(contains\(Cost__c.*\n+.*\/formula>' . | xargs rm
    grep -rl '<lookupDialogsAdditionalFields>Cost__c</lookupDialogsAdditionalFields>' . | xargs sed -i '/<lookupDialogsAdditionalFields>Cost__c<\/lookupDialogsAdditionalFields>/d'
    grep -rl '<lookupFilterFields>Proposal__c</lookupFilterFields>' . | xargs sed -i '/<lookupFilterFields>Proposal__c<\/lookupFilterFields>/d'
    grep -rl '<lookupFilterFields>Dealer_Cost__c</lookupFilterFields>' . | xargs sed -i '/<lookupFilterFields>Dealer_Cost__c<\/lookupFilterFields>/d'


    cd $prt
    if [ -d Cost__c ]
        rm -rf Cost__c
    end
    if [ -d Cost_Setup__c ]
        rm -rf Cost_Setup__c
    end

    cp -r $prt/tmp/Cost__c $prt/Cost__c
    cp -r $prt/tmp/Cost_Setup__c $prt/Cost_Setup__c

    rm -rf tmp
end