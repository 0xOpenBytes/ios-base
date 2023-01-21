#!/bin/bash

read -p 'Project Name: ' projectvar

grep -rli 'base' * | xargs -I@ sed -i '' "s/base/$projectvar/g" @

grep -rli 'NEW_NAME' rename-base.sh | xargs -I@ sed -i '' "s/NEW_NAME/$projectvar/g" @

find . -depth -name '*base*' -execdir bash -c 'mv -i "$1" "${1//base/NEW_NAME}"' bash {} \;

rm 'rename-NEW_NAME.sh'

xcodegen generate
