#!/bin/bash

read -p 'Project Name: ' projectvar

if [[ "$projectvar" =~ [a-zA-Z_][a-zA-Z_0-9]*$ ]]; then
    grep -rli 'NEW_NAME' scripts/rename-base.sh | xargs -I@ sed -i '' "s/NEW_NAME/$projectvar/g" @
    
    sh ./scripts/rename-base.sh
    
    swish appicon
    swish xcodeproj
    
    rm -rf scripts
    rm rename.sh
else
    echo 'Invalid Project Name'
    echo ''
    echo 'The project name should only include the following characters:'
    echo '  - alphanumerics'
    echo '  - "_"'
    echo ''
    echo 'The project name should not start with a number.'
fi


