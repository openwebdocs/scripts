#!/bin/bash
clear
echo "-------- Update all repos! --------------"

# Edit these directories with the ones you want to update
repositories=('bob' 
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

# repos that have 'main' branch (rather than 'master')
mainBranch=(
  'content'
  'mdn-dinocons'
  'yari'
  'mdn-minimalist' 
)

# Edit this to your parent directory's path
SYSTEM_DIR=~/owd

branch=''
path=''

for i in "${repositories[@]}"
  do
    path="${SYSTEM_DIR}/$i"
    cd ${path}

    #check if the repo has a default 'main branch'
    if [[ ${mainBranch[*]} =~ $i ]]
      then 
        branch='main'
      else
        branch='master'
    fi
    
    echo "branch: " ${branch}
    git fetch upstream
    git checkout ${branch}
    git merge upstream/${branch}
    git push origin ${branch}

done

# if you like your computer to talk to you
# say "Mission Accomplished"