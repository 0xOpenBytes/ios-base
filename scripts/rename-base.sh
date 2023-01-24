#!/bin/bash

find . -depth -name '*base*' -execdir bash -c 'mv -i "$1" "${1//base/NEW_NAME}"' bash {} \;

grep -rli 'base' * | xargs -I@ sed -i '' "s/base/NEW_NAME/g" @
grep -rli 'base' .swiftlint.yml | xargs -I@ sed -i '' "s/base/NEW_NAME/g" @

cd .github/workflows/

grep -rli 'base' * | xargs -I@ sed -i '' "s/base/NEW_NAME/g" @
