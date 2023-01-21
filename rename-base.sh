#!/bin/bash

read -p 'Project Name: ' projectvar

grep -rli 'base' * | xargs -I@ sed -i '' "s/base/$projectvar/g" @

for a in *;
do if [ -d "$a" ]; then
 mv -- "$a" "$projectvar"
fi
done
