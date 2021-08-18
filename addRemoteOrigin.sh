#!/bin/bash
clear
echo "-------- Add remote origin for all directories --------------"

# Edit these directories with the ones you want to update
repositories=(
  'bob' 
  'browser-compat-data' 
  'content'
  'css-examples'
  'infra'
  'interactive-examples'
  'kuma'
  'kumascript'
  'learning-area'
  'mdn-dinocons'
  'mdn-minimalist'
  'yari'
);

# Edit this to your parent directory's path
SYSTEM_DIR=~/owd

# Edit to the name of the git organization
ORGANIZATION="mdn"

for i in "${repositories[@]}"
do
  echo "git remote add upstream https://github.com/${ORGANIZATION}/$i.git"
  cd ${SYSTEM_DIR}/$i 
  git branch
  git remote add upstream https://github.com/${ORGANIZATION}/$i.git
done


say "Mission Accomplished"