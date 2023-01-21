#!/bin/bash

read -p 'Project Name: ' projectvar

grep -rli 'NEW_NAME' scripts/rename-base.sh | xargs -I@ sed -i '' "s/NEW_NAME/$projectvar/g" @

sh ./scripts/rename-base.sh

xcodegen generate

rm -rf scripts
rm rename.sh
