#!/bin/bash

# START ----------------------------
#
# Edit these values for your own system 
#
# Edit this to your parent directory's path
SYSTEM_DIR=~/owd
#
# FilePath  - this is what you want if working in MDN content. But edit if you're on another project
REPO_PATH="/content/files/en-us/web/"
# ----------------------------- END

clear
echo "-------- Let's create new md index files --------------"
echo ''

#turn off case sensitivity for user input
shopt -s nocasematch
export sub_path=''
export newFileName=''

goToCorrectDirectory () {
  echo "Where within $SYSTEM_DIR$REPO_PATH would you like to add files?" 
  read sub_path

  path="${SYSTEM_DIR}${REPO_PATH}${sub_path}"

  cd ${path}
  echo "Selected Directory:"
  pwd
  echo "Is that correct? (y/n/x for exit)"
  read continue_on
  if [[ ${continue_on} == 'x' ]]; then 
      echo "Exiting"
      exit
    elif [[ ${continue_on} == 'n' ]]; then
      echo "Let's try again."
      goToCorrectDirectory
  fi
}

#creates a folder and puts index.md in it, calling addContent
createDocuments () {
# Ask the user to enter a folder name
  echo "What is the name of the file you would you like to add?"
  read newFileName 
# create that folder
  if [[ -d ${newFileName} ]]; then
    echo "Sorry, that folder already exists. Try again."
    createDocuments
  else
    mkdir ${newFileName}
    # create an index.md in that folder
    touch ${newFileName}/index.md
    addContent  
  fi
# Ask user to enter a new folder name or exit?
  echo "Would you like to add another file? (y/n)"
  read continue_on
  if [[ ${continue_on} == 'n' ]]; then 
      echo "Exiting"
      exit
    elif [[ ${continue_on} == 'y' ]]; then
      createDocuments
  fi
}
#adds the content to index.md
addContent () {
  # create the tags
  export words=(${sub_path//\// })
  export tags="" 
  for i in ${words[@]}
    do
      tags+="
      - $i"
      echo " - $i"
    done
  
  #create the title
  export length=${#words[*]}
  export usefulFileName=${newFileName//_/ }
  export sectionTitle=(${words[${length}-2]//_// })

  cat > ${newFileName}/index.md <<- EOM
---
title: '${sectionTitle}: ${usefulFileName}'
slug: Web${sub_path}/${newFileName}
tags: 
$tags
 - NeedsContent
---

## Description

## Examples

## Accessibility Concerns

## Best Practices

## See Also
EOM
}

# make sure you're in the right directory
goToCorrectDirectory 

echo "We're in the right directory. Now let's create the files"

# then create the folders and index files
createDocuments