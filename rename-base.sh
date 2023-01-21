#!/bin/bash

read -p 'Project Name: ' projectvar

grep -rli 'base' * | xargs -I@ sed -i '' 's/base/$projectvar/g' @
