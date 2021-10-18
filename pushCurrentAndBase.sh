#!/bin/bash
 
# run after fetching upstream
# ~/scripts/startFresh.sh

# if there aren't two parameters (testing if 2nd is empty)
if [ -z $2 ]; then
	echo "Enter the current branch and main branch names at function call."
	exit
fi

git checkout $2
git pull origin $2
git push origin $2
git checkout $1
git merge origin $2
git commit -am "merge with upstream"
git push origin $1
git status
