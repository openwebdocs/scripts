#!/bin/bash
clear
echo "-------- Update all repos! --------------"

# Edit these directories with the ones you want to update
repositories=('bob' 
  'browser-compat-data' 
  'css-examples'
  'infra'
  'interactive-examples'
  'kuma'
  'learning-area'
  'mdn-dinocons'
  'mdn-minimalist'
  'yari'
);

# Edit this to your parent directory's path
SYSTEM_DIR=~/owd

branch='main'
origin='origin'
path=''

for i in "${repositories[@]}"
  do
    path="${SYSTEM_DIR}/$i"
    cd ${path}

    #content has different origing
    if [[ i == content ]]
      then 
        origin='mdn'
      else
        origin='origin'
    fi

    echo "- - - - - - - - - "
    echo "respository: " ${i}
    echo "branch: " ${branch}
    git fetch upstream
    git checkout ${branch}
    git pull ${origin} ${branch}
    git merge upstream/${branch}
    git push origin ${branch}

done

# if you like your computer to talk to you
# say "Mission Accomplished"
